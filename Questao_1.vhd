LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY flipflopD IS
    PORT(
        D_in   : IN std_logic;   -- Entrada de dados
        clk    : IN std_logic;   -- Clock
        ENABLE : IN std_logic;   -- Controle de direção do deslocamento
        D_out  : OUT std_logic_vector(3 DOWNTO 0)  -- Saída de 4 bits
    );
END flipflopD;

ARCHITECTURE behavioral OF flipflopD IS
    SIGNAL shift_reg : std_logic_vector(3 DOWNTO 0) := "0000";  -- Registrador de deslocamento de 4 bits
BEGIN
    PROCESS(clk)
    BEGIN
        -- Verifica borda de subida do clock
        IF (RISING_EDGE(clk)) THEN
            IF ENABLE = '1' THEN
                -- Deslocamento para a esquerda (shift left)
                shift_reg <= shift_reg(2 DOWNTO 0) & D_in;  -- Desloca para a esquerda e insere D_in na posição LSB
            ELSE
                -- Deslocamento para a direita (shift right)
                shift_reg <= D_in & shift_reg(3 DOWNTO 1);  -- Desloca para a direita e insere D_in na posição MSB
            END IF;
        END IF;
        
        D_out <= shift_reg;  -- Atualiza a saída com o valor do registrador de deslocamento
    END PROCESS;
END behavioral;
