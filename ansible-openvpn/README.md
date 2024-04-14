## Instalação

Para instalar o ansible-server você precisa definir algumas variáveis no arquivo **terraform.tfvars** dentro da pasta terraform-ansible-server:

```
AWS_ACCESS_KEY     =
AWS_SECRET_KEY     =
AWS_REGION         =
VPC_ID             =
ALLOW_SSH_SG       =
ALLOW_ICMP_SG      =
SSH_KEY_NAME       =
PUBLIC_SUBNET_A_ID =
```

Após a criação do ansible-server, você poderá acessar e configurar o inventário executando o playbook config-inventory.yml:

```bash
ansible-playbook /etc/ansible/playbooks/config-inventory.yml  --extra-vars=openvpn_server_ip=<PRIVATE IP OF OPENVPN SERVER>
```

Para usar a conexão ssh via senha, você pode alterar o sshd_config no openvpn-server para aceitar PasswordAuthentication, alterar a senha do ubuntu e configurá-la no inventário do servidor ansible (/etc/ansible/hosts)

```bash
[openvpn-server]
<private ip of openvpn-server> ansible_user=ubuntu ansible_password=<ubuntu password>
```

O playbook abaixo vai copiar o arquivo base e configurar o IP do servidor de OpenVPN, utilize o elastic IP. Caso encontre algum erro de checagem de chave, voce pode se conectar via ssh no openvpn-server a partir do ansible-server para aceitar as chaves do servidor.

```bash
ansible-playbook /etc/ansible/playbooks/config-server.yml  --extra-vars=openvpn_server_ip=<ELASTIC IP OF OPENVPN SERVER>
```

Agora que o servidor está criado, podemos configurar a subnet que será roteada, utilize o playbook abaixo para isso. No exemplo descrito aqui no repositório, os extra-vars serão: "subnet=10.0.21.0 mask=255.255.255.0"


```bash
ansible-playbook /etc/ansible/playbooks/add-subnet.yml  --extra-vars="subnet=<SUBNET> mask=<MASK>"
```

Com o servidor de VPN configurado, podemos criar um cliente:

```bash
ansible-playbook /etc/ansible/playbooks/add-client.yml  --extra-vars=client_name=<client name>
```

O arquivo .ovpn será gerado no openvpn-server em /home/ubuntu/client-configs/files. Você pode configurar a VPN e testar realizando um ping para o IP privado do server-client criado no passo anterior.

Para remover um cliente:

```bash
ansible-playbook /etc/ansible/playbooks/remove-client.yml  --extra-vars="client_name=<cliente name>"
```