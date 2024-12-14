library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux_rd is
    port(
        imm_rd			: in STD_LOGIC;                   
        rs2             : in STD_LOGIC_VECTOR(4 downto 0);
        rd           : in STD_LOGIC_VECTOR(4 downto 0);
        salida_rd          : out STD_LOGIC_VECTOR(4 downto 0) 
    );
end mux_rd;

architecture behavior of mux_rd is
begin
    process(imm_rd, rs2, rd)
    begin
        if imm_rd = '1' then
            salida_rd <= rd;  
        else
            salida_rd <= rs2;  
        end if;
    end process;
end behavior;