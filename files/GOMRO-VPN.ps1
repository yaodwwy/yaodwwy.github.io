# VPN��ַ
$vpnName = "222.187.114.51";
$user = "gomro";
$pass = "r}]Bct2NK]A]TQ9Xbe>X";

$ErrorActionPreference = 'SilentlyContinue'
$vpn = Get-VpnConnection -Name $vpnName
# ����Ƿ���Ҫ����
if(!$?){
	# ����
	Add-VpnConnection -Name $vpnName -ServerAddress $vpnName -TunnelType PPTP -EncryptionLevel Required  -RememberCredential -PassThru
	$vpn = Get-VpnConnection -Name $vpnName
}
# ֱ������
if($vpn.ConnectionStatus -eq "Disconnected"){
	rasdial $vpnName $user $pass;
}
# ɾ������
# Remove-VpnConnection -Name $vpnName -F

Get-VpnConnection -Name $vpnName | findstr ConnectionStatus;

# �鹫��ip
curl ip.sb

echo '����س��Ͽ�����...'
cmd /c "pause>nul"
rasdial $vpnName /DISCONNECT
sleep 2