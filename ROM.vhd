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
		0 => B"11_0000_0000_0001",
		1 => B"00_0000_1100_0000",
		2 => B"00_0000_1000_0000",
		3 => B"11_1111_1000_0000",
		4 => B"00_0111_0100_0000",
		5 => B"00_0000_1100_0001",
		6 => B"11_1100_0010_0000",-- para 32 : 11_1100_0010_0000
		7 => B"00_0000_1100_0010",
		8 => B"00_1000_0100_0001",
		9 => B"01_1111_1100_0010",
		10 => B"11_0011_1111_0110", 
		11 => B"00_0000_0000_0000", -- NOP Aqui acaba o preenchimento da memoria
		12 => B"11_0000_0000_0001",
		13 => B"00_0000_1100_0000", 
		14 => B"11_0000_0000_0001", -- Começo loop externo
		15 => B"00_0111_0100_0000",
		16 => B"00_0000_1100_0000",
		17 => B"00_0111_0100_0000", -- Começo loop interno
		18 => B"00_0000_1100_0001",
		19 => B"00_0000_1000_0000",
		20 => B"11_0000_0000_0000",
		21 => B"11_1111_1000_0000",
		22 => B"00_1000_0100_0001",
		23 => B"11_1100_0010_0000",
		24 => B"00_0000_1100_0010",
		25 => B"00_1000_0100_0001",
		26 => B"01_1111_1100_0010",
		27 => B"11_0011_1111_0100", -- Fim loop interno
		28 => B"00_0000_0000_0000",
		29 => B"00_1000_0100_0000",
		30 => B"11_1100_0010_0000",
		31 => B"00_0000_1100_0010",
		32 => B"01_1111_1100_0010",
		33 => B"11_0011_1110_1011", -- Fim loop externo
		34 => B"00_0000_0000_0000",

		others => (others=>'0')
	);

begin
	
	rom_dado <= conteudo_rom(to_integer(unsigned(rom_endereco)));	

end architecture;