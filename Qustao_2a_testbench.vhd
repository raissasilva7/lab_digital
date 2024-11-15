LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS

    -- Instanciação do flip-flop T (UUT)
    COMPONENT flipflopT
        PORT(
            T_in   : IN std_logic;
            clk    : IN std_logic;
            Q_out  : OUT std_logic
        );
    END COMPONENT;

    -- Sinais de entrada e saída para o testbench
    SIGNAL T_in  : std_logic := '0';
    SIGNAL clk   : std_logic := '0';
    SIGNAL Q_out : std_logic;

    CONSTANT clk_period : time := 10 ns;  -- Período do clock

BEGIN

    -- Instancia o flip-flop T
    UUT: flipflopT PORT MAP (
        T_in  => T_in,
        clk   => clk,
        Q_out => Q_out
    );

    -- Geração do clock (processo de clock)
    clk_process : PROCESS
    BEGIN
        FOR i IN 0 TO 20 LOOP
            clk <= '0';
            WAIT FOR clk_period / 2;
            clk <= '1';
            WAIT FOR clk_period / 2;
        END LOOP;
        WAIT;
    END PROCESS;

    -- Estímulos para a entrada T
    stim_proc: PROCESS
    BEGIN
        -- Teste 1: T = 0, Q não muda
        T_in <= '0';
        WAIT FOR clk_period * 2;

        -- Teste 2: T = 1, Q deve alternar
        T_in <= '1';
        WAIT FOR clk_period * 2;

        -- Teste 3: T = 0, Q não muda
        T_in <= '0';
        WAIT FOR clk_period * 2;

        -- Teste 4: T = 1, Q deve alternar novamente
        T_in <= '1';
        WAIT FOR clk_period * 2;

        -- Teste 5: T = 0, Q não muda
        T_in <= '0';
        WAIT FOR clk_period * 2;

        -- Finaliza a simulação
        WAIT;
    END PROCESS;

END behavior;
