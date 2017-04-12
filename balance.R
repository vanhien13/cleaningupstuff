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

library(data.table)
Balance_Panel = function(Data, Indiv_ColName, Time_ColName){
    Individuals = unique(Data[, get(Indiv_ColName)])
    Times = unique(Data[, get(Time_ColName)])

    Full_Panel = data.table(expand.grid(Individuals, Times))
    setnames(Full_Panel, c(Indiv_ColName, Time_ColName))
    setkeyv(Full_Panel, c(Indiv_ColName, Time_ColName))
    setkeyv(Data, c(Indiv_ColName, Time_ColName))
    return(Data[Full_Panel])
}
