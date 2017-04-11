balanced<-function(data, ID, TIME, VARS, required=c("all","shared")) {
    if(is.character(ID)) {
        ID <- match(ID, names(data))
    }
    if(is.character(TIME)) {
        TIME <- match(TIME, names(data))
    }
    if(missing(VARS)) { 
        VARS <- setdiff(1:ncol(data), c(ID,TIME))
    } else if (is.character(VARS)) {
        VARS <- match(VARS, names(data))
    }
    required <- match.arg(required)
    idf <- do.call(interaction, c(data[, ID, drop=FALSE], drop=TRUE))
    timef <- do.call(interaction, c(data[, TIME, drop=FALSE], drop=TRUE))
    complete <- complete.cases(data[, VARS])
    tbl <- table(idf[complete], timef[complete])
    if (required=="all") {
        keep <- which(rowSums(tbl==1)==ncol(tbl))
        idx <- as.numeric(idf) %in% keep
    } else if (required=="shared") {
        keep <- which(colSums(tbl==1)==nrow(tbl))
        idx <- as.numeric(timef) %in% keep
    }
    data[idx, ]
}

balanced(unbal, "PERSON","YEAR")

missing.at.least.one <- unique(unbal$PERSON[!complete.cases(unbal)])
unbal[!(unbal$PERSON %in% missing.at.least.one),]
