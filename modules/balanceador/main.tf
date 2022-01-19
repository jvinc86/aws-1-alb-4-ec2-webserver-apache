resource "aws_lb_target_group" "mi_pagos_tg" {
  name     = "${var.la_aplicacion_1}-${var.proyecto}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.el_id_de_la_VPC
}

resource "aws_lb_target_group" "mi_compras_tg" {
  name     = "${var.la_aplicacion_2}-${var.proyecto}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.el_id_de_la_VPC
}

resource "aws_lb" "mi_app_lb" {
  name               = "${var.proyecto}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sec_group_id]
  subnets            = [for i in range(0, 3) : var.los_IDs_subredes[i]]
}

resource "aws_lb_target_group_attachment" "vms_en_tg_pagos" {
  count            = 2
  target_group_arn = aws_lb_target_group.mi_pagos_tg.arn
  target_id        = var.id_instancias[count.index]
  port             = 80
}

resource "aws_lb_target_group_attachment" "vms_en_tg_compras" {
  count            = 2
  target_group_arn = aws_lb_target_group.mi_compras_tg.arn
  target_id        = var.id_instancias[count.index+2]
  port             = 80
}

resource "aws_lb_listener" "lb_listener_front_end" {
  load_balancer_arn = aws_lb.mi_app_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.mi_compras_tg.arn
  }
}

resource "aws_lb_listener_rule" "barra_compras" {
  listener_arn = aws_lb_listener.lb_listener_front_end.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.mi_compras_tg.arn
  }

  condition {
    path_pattern {
      values = ["/compras/*"]
    }
  }
}

resource "aws_lb_listener_rule" "barra_pagos" {
  listener_arn = aws_lb_listener.lb_listener_front_end.arn
  priority     = 200

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.mi_pagos_tg.arn
  }

  condition {
    path_pattern {
      values = ["/pagos/*"]
    }
  }
}