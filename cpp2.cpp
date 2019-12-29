void Subnet::load_subnet(std::string input) {
	char tokenizable[30];
	char * tok;
	uint8_t intTok;
	int maskLength;
	std::vector<uint8_t> inputAddress;
	std::vector<uint8_t> maskAddress;

	input.copy(tokenizable, 30);
	tok = strtok(tokenizable, "./");
	for (size_t i = 0; i < 4; i++) //fill octets
	{
		intTok = atoi(tok);
		inputAddress.push_back(intTok);
		tok = strtok(NULL, "./");
	}
	maskLength = atoi(tok);
	this->inputAddress.set_address(inputAddress); //now this->inputaddress contains address in vector
	//build mask address
	maskAddress = convert_cidr(maskLength);
	this->maskAddress.set_address(maskAddress);

	this->subnetAddress.set_address(get_subnet());

	this->subnetBC.set_address(get_subnet_broadcast());

	this->classfulAddress.set_address(get_classful());

	get_usable_nums(maskLength);

	get_addr_range();

	this->isValid = get_valid_status();

}
