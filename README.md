# K8sDemoGreen
K8sDemoGreen with CICD

## Nginx Ingress

```bash
helm install nginx-ingress nginx-stable/nginx-ingress --set rbac.create=true --set controller.service.type=NodePort --set controller.service.httpPort.nodePort=PORT_NUM_1 --set controller.service.httpsPort.nodePort=PORT_NUM_2
```
*Update PORT_NUM_1 and PORT_NUM_2 with your custom ports to access nginx ingress controller*

## Reference

[nginx-ingress-controller](https://docs.nginx.com/nginx-ingress-controller/installation/installation-with-helm/)

[nginix-controller](https://platform9.com/learn/v1.0/tutorials/nginix-controller-helm)

