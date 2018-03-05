Param(
    $NetworkMode = "L2Bridge"
)

$env:KUBE_NETWORK=$NetworkMode.ToLower()
ipmo c:\k\hns.psm1
Get-HnsPolicyList | Remove-HnsPolicyList
c:\k\kube-proxy.exe --v=4 --proxy-mode=kernelspace --hostname-override=$(hostname) --kubeconfig=c:\k\config
