LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY flipflopD IS
PORT(
    D_in   : IN std_logic;  -- Entrada D
    clk    : IN std_logic;  -- Clock
    D_out  : OUT std_logic  -- Saída Q
);
END flipflopD;

ARCHITECTURE behavioral OF flipflopD IS
BEGIN
    PROCESS(clk)
    BEGIN
        IF (RISING_EDGE(clk)) THEN
            D_out <= D_in;  -- Captura o valor de D na borda de subida do clock
        END IF;
    END PROCESS;
END behavioral;
