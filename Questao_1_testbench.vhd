LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS
    COMPONENT flipflopD
        PORT(
            D_in   : IN std_logic;
            clk    : IN std_logic;
            ENABLE : IN std_logic;
            D_out  : OUT std_logic_vector(3 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL Din   : std_logic := '0';
    SIGNAL clk   : std_logic := '0';
    SIGNAL Dout  : std_logic_vector(3 DOWNTO 0);
    SIGNAL ENABLE : std_logic := '1';  -- Controle de direção

    CONSTANT clk_period : time := 10 ns;  -- Período do clock

BEGIN
    -- Instancia o flip-flop no testbench
    UUT: flipflopD PORT MAP (
        D_in   => Din,
        clk    => clk,
        ENABLE => ENABLE,
        D_out  => Dout
    );

    -- Processo de geração do clock
    clk_process : PROCESS
    BEGIN
        FOR i IN 0 TO 20 LOOP  -- Aumentei o número de ciclos para visualizar melhor
            clk <= '0';
            WAIT FOR clk_period / 2;
            clk <= '1';
            WAIT FOR clk_period / 2;
        END LOOP;
        WAIT;
    END PROCESS;

    -- Processo de estímulos
    stim_proc: PROCESS
    BEGIN
        -- Teste 1: ENABLE = '1', deslocamento para a esquerda
        Din <= '1';  -- Define o valor de entrada
        ENABLE <= '1';  -- Ativa o deslocamento para a esquerda
        WAIT FOR clk_period * 2;

        Din <= '0';
        WAIT FOR clk_period * 2;

        -- Teste 2: ENABLE = '0', deslocamento para a direita
        ENABLE <= '0';  -- Ativa o deslocamento para a direita
        Din <= '1';  
        WAIT FOR clk_period * 2;

        Din <= '0';
        WAIT FOR clk_period * 2;

        -- Teste 3: Continuar os deslocamentos
        ENABLE <= '1';  -- Continua o deslocamento para a esquerda
        Din <= '1';
        WAIT FOR clk_period * 2;

        WAIT;
    END PROCESS;

END behavior;
