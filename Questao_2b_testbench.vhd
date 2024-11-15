LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS

    COMPONENT flipflopD
        PORT(
            D_in   : IN std_logic;
            clk    : IN std_logic;
            D_out  : OUT std_logic
        );
    END COMPONENT;

    SIGNAL Din  : std_logic := '0';
    SIGNAL clk  : std_logic := '0';
    SIGNAL Dout : std_logic;

    CONSTANT clk_period : time := 10 ns;  -- Período do clock

BEGIN

    UUT: flipflopD PORT MAP (
        D_in  => Din,
        clk   => clk,
        D_out => Dout
    );

    clk_process : PROCESS
    BEGIN
        FOR i IN 0 TO 10 LOOP
            clk <= '0';
            WAIT FOR clk_period / 2;
            clk <= '1';
            WAIT FOR clk_period / 2;
        END LOOP;
        WAIT;
    END PROCESS;

    stim_proc: PROCESS
    BEGIN
        Din <= '0';
        WAIT FOR clk_period * 2;

        Din <= '1';
        WAIT FOR clk_period * 2;

        Din <= '0';
        WAIT FOR clk_period * 2;

        Din <= '1';
        WAIT FOR clk_period * 2;

        Din <= '0';
        WAIT FOR clk_period * 2;

        WAIT;
    END PROCESS;

END behavior;
