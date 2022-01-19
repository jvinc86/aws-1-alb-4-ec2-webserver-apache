output Rango_de_IPs_Subred { value  = aws_subnet.mi_subred[*].cidr_block }

output IDs_subredes_Forma_1 { 
    value = aws_subnet.mi_subred[*].id
}
output IDs_subredes_Forma_2 { 
    value = aws_subnet.mi_subred.*.id
}
output IDs_subredes_Forma_3 {
    value = [for elemento in aws_subnet.mi_subred : elemento.id]
}
output IDs_subredes_Forma_4 {
    value = [for i in range(0, 3) : aws_subnet.mi_subred[i].id]
}