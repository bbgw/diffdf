#include <Rcpp.h>
using namespace Rcpp;


//This function takes two character vectors and returns a logical vector
// indicating where they differ

// [[Rcpp::export]]
std::vector<bool> stringdiff(CharacterVector x, CharacterVector y) {
    int n = x.size();
    const bool initial_value = false;
    std::vector<bool> out(n, initial_value);
    double diff;
    
    for (int i =0; i < n; ++i){
        //handle nas
        if (CharacterVector::is_na(x[i]) & CharacterVector::is_na(y[i]) ){
            out[i] = FALSE;
        } else if (CharacterVector::is_na(x[i]) | CharacterVector::is_na(y[i])){
            out[i] = TRUE;
        } else{ 
            
        //comparison    
        out[i] = x[i]!=y[i];
        }
    }
    return out;
}

