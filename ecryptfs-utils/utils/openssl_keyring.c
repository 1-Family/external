/**
 * Copyright (C) 2006 International Business Machines
 * Author(s): Trevor S. Highland <trevor.highland@gmail.com>
 *            Michael C. Thompson <mcthomps@us.ibm.com>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
 * 02111-1307, USA.
 */

#include <errno.h>
#include <sys/types.h>
#include <keyutils.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "../include/ecryptfs.h"
#include <private/android_filesystem_config.h>

int main(int argc, char **argv)
{
	int rc = 0;
	int temp_rc =0;
	uid_t uid = getuid();
	uid_t euid = geteuid();

	if (argc > 1) {
		ALOGE("%s cannot run with arguments", argv[0]);
	}
	if (uid != euid || (euid != AID_ROOT && euid != AID_ECRYPTFS))
	{
		ALOGE("The user %d is not permitted to execute %s", uid, argv[0]);
		rc = 1;
		goto out;
	}

	uint32_t version;
	struct ecryptfs_ctx ecryptfs_ctx;
	if ((rc = ecryptfs_validate_keyring())) {
		ALOGE("Error attempting to validate keyring integrity; "
		       "rc = [%d]\n", rc);
		return 1;
	}

	if ((rc = ecryptfs_register_key_modules(&ecryptfs_ctx))) {
		ALOGE("Failed to register key modules; rc = [%d]\n", rc);
		goto out;
	}
	if ((rc = ecryptfs_get_version(&version))) {
		version = ECRYPTFS_VERSIONING_PASSPHRASE;
	}
	struct ecryptfs_key_mod *key_mod = ecryptfs_ctx.key_mod_list_head.next;
	while (key_mod && strcmp(key_mod->alias, "openssl")) {
		key_mod = key_mod->next;
	}
	if (key_mod == NULL) {
		rc = 1;
		goto release;
	}

	char auth_tok_sig[ECRYPTFS_SIG_SIZE_HEX+1] = {0};
	struct key_mod_param_val param_vals[] = {
		{.id = 1,
		 .val = "5489fdjkdf8934jkdxaij23409dvc;'as-034kjlf905fklj590vknl54tivbl09yszke56gfdklgf90",
		},
		{.id = 2,
		 .val = "/system/etc/keyfile",
		}
	};
	key_mod->param_vals = param_vals;
	key_mod->num_param_vals = sizeof(param_vals)/sizeof(struct key_mod_param_val);

	rc = ecryptfs_add_key_module_key_to_keyring(auth_tok_sig, key_mod);

release:
	temp_rc = ecryptfs_free_key_mod_list(&ecryptfs_ctx);
	if (rc == 0) {
		rc = temp_rc;
	}
out:
	return rc;
}
