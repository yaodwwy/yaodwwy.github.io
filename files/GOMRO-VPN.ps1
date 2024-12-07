# VPN地址
$vpnName = "222.187.114.51";
$user = "gomro";
$pass = "r}]Bct2NK]A]TQ9Xbe>X";

$ErrorActionPreference = 'SilentlyContinue'
$vpn = Get-VpnConnection -Name $vpnName
# 检查是否需要创建
if(!$?){
	# 创建
	Add-VpnConnection -Name $vpnName -ServerAddress $vpnName -TunnelType PPTP -EncryptionLevel Required  -RememberCredential -PassThru
	$vpn = Get-VpnConnection -Name $vpnName
}
# 直接连接
if($vpn.ConnectionStatus -eq "Disconnected"){
	rasdial $vpnName $user $pass;
}
# 删除命令
# Remove-VpnConnection -Name $vpnName -F

Get-VpnConnection -Name $vpnName | findstr ConnectionStatus;

# 查公网ip
curl ip.sb

echo '点击回车断开连接...'
cmd /c "pause>nul"
rasdial $vpnName /DISCONNECT
sleep 2