function checkconvert = checkconvert()

A = [1	1/3	1/5	1	1/4	2	3;
3	1	1/2	2	1/3	3	3;
	5	2	1	4	5	6	5;
	1	1/2	1/4	1	1/4	1	2;
4	3	1/5	4	1	3	1;
1/2	1/3	1/6	1	1/3	1	1/3;
	1/3	1/3	1/5	1/2	1	3	1];

const = consistency(A)

if (const == 0)
    A = matrix(A);
end

const = consistency(A)

end
