function rankByPrefs = rankByPrefs(ranker, toRank, size)
    for x = 1:size
        subject = toRank(x)
        scores(x,1) = score(ranker, toRank(x));
    end
    scores
    rankByPrefs = prefsOrder(scores);
end