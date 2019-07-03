-- *******************************************************************
-- *                                                                 *
-- * 20190703  Initial creation                                      *
-- *                                                                 *
-- *******************************************************************
with Ada.Text_IO;

procedure Start is
 package IO renames Ada.Text_IO;

-- This_Is_Legal : Integer;
-- ThisIsLegal2 : Integer;
-- Andso2isthisverylongandsomewhathardtoreadnameinmostlylowercase: Integer;

 -- this is not legal
 --range : Integer;

 -- this is not legal
 --if : Integer;

 -- this is not legal, but what a nice error message!!
 --_This_Is_Illegal : Integer;

 -- this is not legal, but what a nice error message!!
 --This__Is_Illegal : Integer;

-- this is not legal, but what a nice error message!!
-- This_Is_Illegal_ : Integer;

-- this is not going to work, but what a nice error message!!
-- ThisIsNotGoingToWork : Integer;
-- THISISNOTGOINGTOWORK : Integer;

 X, Y : Integer :=10;
 Result : Integer :=0;

begin
 IO.Put_Line("Hello Identifiers!!!!  " & Integer'Image(X));

 Result := X * (Y/2);

 if Y/2 = 5 then
  IO.Put_Line ("Y Divides");
 end if;

 if (X > 5) then
  IO.Put_Line ("X > 5");
 end if;

 if (Y < 100) then
  IO.Put_Line ("Y < 100");
 end if;

 if (X + Y) > 15 then
  IO.Put_Line("Greater than 15");
 end if;

 if (X - Y) < 1 then
  IO.Put_Line("Less than 1");
 end if;

 Result := X**2;
 IO.Put_Line(Integer'Image(Result));


end Start;
