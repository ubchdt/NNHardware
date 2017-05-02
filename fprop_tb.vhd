library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use work.types.all;

entity fprop_tb is
end fprop_tb;

architecture behavioural of fprop_tb is
	component fprop
	Port(CLOCK_27 : in std_logic;
	     RESET    : in std_logic;
	     INPUTS   : in input_neuron_type;
             WEIGHTS  : in weight_neuron_type;
	     BIASES   : in bias_neuron_type;
             OUTPUTS  : out output_neuron_type
	     );
	end component;

signal CLOCK_27_TB: std_logic;
signal RESET_TB   : std_logic;
signal INPUTS_TB  : input_neuron_type;
signal WEIGHTS_TB : weight_neuron_type;
signal BIASES_TB  : bias_neuron_type;
signal OUTPUTS_TB  : output_neuron_type;

begin



dut: fprop port map(CLOCK_27 => CLOCK_27_TB,
                    RESET    => RESET_TB,
		    INPUTS   => INPUTS_TB,
		    WEIGHTS  => WEIGHTS_TB,
		    BIASES   => BIASES_TB,
   		    OUTPUTS  => OUTPUTS_TB);
process
begin
	RESET_TB <= '0';
	OUTPUTS_TB(0) <= to_signed(2, NEURON_BIT_SIZE);
	for i in INPUTS_TB'range loop
		INPUTS_TB(i) <= "00";
	end loop;

	for j in BIASES_TB'range loop
		BIASES_TB(j) <= "01";
	end loop;

	for k in WEIGHTS_TB'range(1) loop
		for l in WEIGHTS_TB'range(2) loop
			WEIGHTS_TB(0, k) <= "10";
		end loop;
	end loop;
	wait;
end process;

 process
  begin
    wait for 10 ns;
    CLOCK_27_TB <= '0';
    wait for 10 ns;
    CLOCK_27_TB <= '1';
  end process;

end architecture;
			

