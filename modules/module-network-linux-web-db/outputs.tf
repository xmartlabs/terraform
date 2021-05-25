#For the EC2 instance
output "network_interface_id" {
  value = aws_network_interface.network_interface.id
}
#For the RDS instance
output "vpc_id" {
  value = aws_vpc.vpc.id
}
output "security_group_db_id" {
  value = aws_security_group.security_group_db.id
}
output "private_subnet_id" {
  value = aws_subnet.subnet-2.id
}
output "pubic_subnet_id" {
  value = aws_subnet.subnet-1.id
}