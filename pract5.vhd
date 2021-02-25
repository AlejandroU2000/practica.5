LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Practica5 IS
    Port (
    	 a : in STD_LOGIC_VECTOR(4 DOWNTO 0);
		 b : in STD_LOGIC_VECTOR(4 DOWNTO 0);
		 d_a : out STD_LOGIC_VECTOR(6 DOWNTO 0);
		 d_b : out STD_LOGIC_VECTOR(6 DOWNTO 0);
		 c_fin : out STD_LOGIC
             );
END Practica5;
 

ARCHITECTURE Practica5_arc OF Practica5 IS
-- constants
-- signals
		SIGNAL s : STD_LOGIC_VECTOR(5 downto 0);
		SIGNAL aux : STD_LOGIC_VECTOR(3 downto 0);

Component BinA7Seg 
	Port(
		 	A : in  STD_LOGIC_VECTOR (3 downto 0);
      	seg7 : out  STD_LOGIC_VECTOR (6 downto 0));
END COMPONENT;

Component Sumador5Bits
port (a,b : in std_logic_vector (4 downto 0);
	s: out std_logic_vector (4 downto 0);
	c_out : out std_logic);
END COMPONENT;

BEGIN 

Suma : Sumador5Bits
PORT MAP(
			a => a,
			b => b,
			s => s,
			c_out => c_fin
			
		 );

i_display1 : BinA7Seg
PORT MAP(
A => s(3 downto 0),
			seg7 => d_a);
aux <= "000" & s(4);

i_display2 : BinA7Seg
PORT MAP(

			A => aux,
			seg7 => d_b
		);

END Practica5_arc;
