structure IntHist =
  SmallHistogram
    (type key = int
     val compare = Int.compare)