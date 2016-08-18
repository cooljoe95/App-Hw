def sum_to (n)
    if n < 1
        return nil
    end

    if n == 1
        return 1
    end

    n + sum_to(n -1)
end

def add_numbers(ar = nil)
    if ar == nil
        return nil
    end
    
    if ar.length == 1
        return ar[0]
    end
    
    ar[0] + add_numbers(ar[1..-1])
end

def gamma_fnc(num)
    if num < 1
        return nil
    end
    
    if num <= 2
        return 1
    end
    
    (num - 1) * gamma_fnc(num - 1)
end
