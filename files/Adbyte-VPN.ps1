# VPN��ַ
$vpnName = "adbyte.tpddns.cn";
$user = "adam";
$pass = "CKkUyc5gegAnXgf";

$ErrorActionPreference = 'SilentlyContinue'
$vpn = Get-VpnConnection -Name $vpnName
# ����Ƿ���Ҫ����
if(!$?){
	# ����
	Add-VpnConnection -Name $vpnName -ServerAddress $vpnName -TunnelType L2tp -L2tpPsk 12345678 -EncryptionLevel Required  -RememberCredential -PassThru
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