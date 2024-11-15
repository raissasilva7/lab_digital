LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY flipflopT IS
PORT(
    T_in   : IN std_logic;  -- Entrada T
    clk    : IN std_logic;  -- Clock
    Q_out  : OUT std_logic  -- Saída Q
);
END flipflopT;

ARCHITECTURE behavioral OF flipflopT IS
    SIGNAL Q_int : std_logic := '0';  -- Sinal interno para armazenar o estado
BEGIN
    PROCESS(clk)
    BEGIN
        IF (RISING_EDGE(clk)) THEN
            IF (T_in = '1') THEN
                Q_int <= NOT Q_int;  -- Alterna o valor de Q quando T é 1
            END IF;
        END IF;
    END PROCESS;

    -- Atribui o valor de Q_int à saída Q_out
    Q_out <= Q_int;
END behavioral;
