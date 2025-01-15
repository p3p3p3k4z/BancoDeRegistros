library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity suma4 is
    Port (
        clk   : in  STD_LOGIC;                    -- Se�al de reloj
        rst   : in  STD_LOGIC;                    -- Se�al de reset
        a_in  : in  STD_LOGIC_VECTOR(11 downto 0); -- Incremento/decremento din�mico
        a_out : out STD_LOGIC_VECTOR(11 downto 0)  -- Direcci�n calculada
    );
end suma4;

architecture Behavioral of suma4 is
    signal counter : INTEGER range 0 to 38 := 0; -- Contador interno con soporte para valores negativos
begin
    process(clk, rst)
    begin
        if rst = '1' then
            -- Reinicia el contador a cero cuando se activa el reset
            counter <= 0;
        elsif rising_edge(clk) then
            -- Actualiza el contador sumando el valor de a_in convertido a entero
            counter <= counter + to_integer(signed(a_in));
            
            -- Asegura que el contador no exceda los l�mites (-38 a 38)
            if counter > 38 then
                counter <= 38;
            elsif counter < 0 then
                counter <= 0;
            end if;
        end if;
    end process;

    -- Convierte el contador a STD_LOGIC_VECTOR para la salida
    a_out <= std_logic_vector(to_signed(counter, 12));
end Behavioral;
