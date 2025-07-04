[frontend]
${frontend_ip} ansible_user=${admin_username}

[backend]
${backend_ip} ansible_user=${admin_username}

[db]
${database_ip} ansible_user=${admin_username}
