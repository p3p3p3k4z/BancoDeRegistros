library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity memoria_del_programa is
    Port (
        a   : in STD_LOGIC_VECTOR(11 downto 0); -- Entrada del contador de programa (5 bits)
        do  : out STD_LOGIC_VECTOR(31 downto 0) -- Salida de bits de instrucción
    );
end memoria_del_programa;

architecture Behavioral of memoria_del_programa is

    type mem_array is array (0 to 38) of STD_LOGIC_VECTOR(31 downto 0);
    
    signal memInstr : mem_array := (
        0 => "00000001010010101000100110110011",-- add x19,x21,x20--"00000000001000011000010100110011", -- ADD
        1 => "00000000001000011000010100010011", -- ADDI  
        2 => "00000000010010011010101100000011", -- lw 
        3 => "11111111111111111111111111111111", 
        4 => "00000010000100001000010001100011", --"11111111111010011000101010010011",-- addi x21,x19,-2 --"01000000001000011000010100110011", -- SUB 
        5 => "11111111111000011000010100010011", -- ADD NEG 
        6 => "00000000011100100010010000100011", -- sw
        7 => "00001111000011110000111100001111", 
        8 => "00000000010010100010101010000011",-- lw x21, 4(x20 --"00000000001000011111010100110011", -- AND 
        9 => "00000000001000011111010100010011", -- ANDI
        10 => "00000000000000000000000000000000", -- nada apartir
        11 => "00001111000011110000111100001111", 
        12 => "00000001001110100010010000100011",-- sw x19, 8(x20) --"00000000001000011110010100110011", -- OR 
        13 => "00000000001000011110010100010011", -- ORI
        14 => "00000000000000000000000000000000", -- lbu
        15 => "00000000000011110000000000001111",
        16 => "00000010000100000110000001100011",--"00000000100000000010101010000011",-- lw x21, 8(x0) --"00000000001000011100010100110011", -- XOR
        17 => "00000000001000011100010100010011", -- XORI
        18 => "00000000000000000000000000000000", -- lhu
        19 => "11111111111111111010101010101010",
        20 => "00000000001000011010010100110011", -- STL
        21 => "00000000001000011010010100010011", -- STLI
        22 => "00000000000000000000000000000000", -- sb
        23 => "11111111111100001111000011110000",
        24 => "11111110000100000100100011100011",-- "00000000001000011011010100110011", -- STLU
        25 => "00000000001000011011010100010011", -- STLUI
        26 => "00000000000000000000000000000000", -- sh
        27 => "11110000000000000000111111111111",
        28 => "00000000001000011001010100110011",-- SLL
        29 => "00000000001000011001010100010011",-- SLLI
        30 => "00000000000000000000000000000000",-- sw
        31 => "00000000000000000000000000000000",
		32 => "00000000001000011101010100110011", -- SRL
		33 => "00000000001000011101010100010011", -- SRLI
		34 => "00000000000000000000000000000000", -- nada
		35 => "11111111111111111111111111111111",
		36 => "01000000001000011101010100110011", -- SRLA 
		37 => "01000000001000011101010100010011", -- SRLAI
		38 => "00000000000000000000000000000000"  -- nada
    );
begin

    do <= memInstr(conv_integer(a)); 
    
end Behavioral;
