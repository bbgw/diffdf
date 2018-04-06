





context("dfdiff_has_issues")


test_that( "dfdiff_has_issues works as expected",{
    
    ### Note that the first 2 comparisons in list_of_datasets are identical so we expect true
    ### all others are different so we expect false
    
    for ( i in 1:length(list_of_comparisons)){
        x <- dfdiff(
            list_of_comparisons[[i]][[1]] , 
            list_of_comparisons[[i]][[2]] , 
            suppress_warnings = T
        ) 
        if ( i %in% c(1,2)) {
            expect_false(dfdiff_has_issues(x))
        } else {
            expect_true( dfdiff_has_issues(x))
        }
        
    }
    
    ## Testing with keys
    comp <- list_of_comparisons[["everything"]]
    expect_true(
        dfdiff_has_issues(
            dfdiff( comp[[1]] ,  comp[[2]] , keys = c("ID" , "GROUP1"), suppress_warnings = T)  
        )
    )
    
    expect_false(
        dfdiff_has_issues(
            dfdiff( TDAT ,  TDAT , keys = c("ID" , "GROUP1"), suppress_warnings = T)  
        )
    )
    
    
})


































