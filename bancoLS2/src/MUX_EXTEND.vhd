library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MUX_EXTEND is
    port(
        alu_src			: in STD_LOGIC;                    -- Se�al de control para seleccionar la entrada
        ext             : in STD_LOGIC_VECTOR(31 downto 0); -- Entrada de 31 bits del extensor de signo
        banco           : in STD_LOGIC_VECTOR(31 downto 0); -- Entrada de 31 bits del banco de registros
        salida          : out STD_LOGIC_VECTOR(31 downto 0)  -- Salida seleccionada (31 bits)
    );
end MUX_EXTEND;

architecture behavior of MUX_EXTEND is
begin
    process(alu_src, ext, banco)
    begin
        if alu_src = '1' then
            salida <= ext;  -- La salida ser� directamente el valor de ext, ya que es de 31 bits
        else
            salida <= banco;  -- La salida ser� directamente el valor de banco, tambi�n de 31 bits
        end if;
    end process;
end behavior;
