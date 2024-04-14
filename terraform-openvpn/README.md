# Criação de um servidor OpenVPN na AWS utilizando terraform e user data

Esse exercício tem como objetivo criar e configurar um servidor OpenVPN, deixando ele pronto para a criação de usuários.


## Instalação

Certifique-se de preencher em **terraform.tfvars** as seguintes variáveis:

```config
AWS_ACCESS_KEY     = "aws_key"
AWS_SECRET_KEY     = "aws_secret"
AWS_REGION         = "aws_region"
VPC_ID             = "vpc_id"
ALLOW_SSH_SG       = "allow_ssh_security_group"
SSH_KEY_NAME       = "ssh_key"
```

Essa instalação pressupõe que você já tem uma VPC criada, utilizando como CIDR base ranges que envolvem 10.0.20.0/24 e 10.0.21.0/24. Por exemplo, uma VPC criada com o CIDR 10.0.0.0/16.
Além disso, você também deve ter o Security Group que permite acesso SSH criado nessa VPC.
Caso não tenha uma VPC nem o security group, utilize esse repositório para criar: https://github.com/grschroder/terraform-aws-vpc

Após a configuração das variáveis, basta executar os comandos terraform abaixo:

```bash
terraform plan
```

```bash
terraform apply
```

Salve os outputs em um gerenciador de texto para que você possa utilizar nos próximos passos.

Após isso, o servidor de openvpn vai estar criado, juntamente com um servidor client que está em outra subnet e servirá para testar o roteamento. 

A próxima etapa está no README.md dentro da pasta ansible-openvpn. 