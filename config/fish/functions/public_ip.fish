function public_ip
	dig +short myip.opendns.com @resolver1.opendns.com
end
