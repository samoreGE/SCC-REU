function rankByPrefs = rankByPrefs(ranker, toRank, size)
    for x = 1:size
        scores(x,1) = score(ranker, toRank(x));
    end
    rankByPrefs = prefsOrder(scores);
end