function inferScore = inferScore (posPercent, total)
    pos = total * posPercent + 1
    neg = total * (1 - posPercent) + 1
    inferScore = calcMean(pos, neg)/calcVariance(pos, neg)
end

function calcMean = calcMean(pos, neg)
    calcMean = pos/(pos + neg)
end

function calcVariance = calcVariance(pos, neg)
    numer = neg * pos
    denom = (pos+neg)^2 * (pos+neg+1)
    calcVariance = numer/denom
end