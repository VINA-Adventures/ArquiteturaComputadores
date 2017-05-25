library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


--------------ESPECIFICACOES PIC16F1618---------------------
--- O PC tem 15 bits, entao existem 32k endereços na ROM.
--- Os opcodes do PIC sao de 14 bits, entao esse e o tamanho
---		do dado da ROM.										 

entity ROM is
	port(	
			rom_endereco: in unsigned (15 downto 0);
			rom_dado	: out unsigned (13 downto 0)
	);
end entity;

architecture a_ROM of ROM is
	
	type mem is array (0 to 2**16-1) of unsigned(13 downto 0);

	constant conteudo_rom : mem := (
		-- caso endereco => conteudo
		0 => B"11000000000000",
		1 => B"00000010000011",
		2 => B"00000010000100",
		3 => B"00100000000011",
		4 => B"00011100000100",
		5 => B"00000010000100",
		6 => B"11000000000001",
		7 => B"00011110000011",
		8 => B"00100000000011",
		9 => B"11110000011110",
		10 => B"00000010000001",
		11 => B"01100000000001",
		12 => B"11001111110101",
		13 => B"00000000000000",
		14 => B"00100000000100",
		15 => B"00000010000101",
		others => (others=>'0')
	);

begin
	
	rom_dado <= conteudo_rom(to_integer(unsigned(rom_endereco)));	

end architecture;