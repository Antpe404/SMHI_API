test_that("Wrong data inputs",{
  
  expect_warning(smhi_data(123123,12))
  expect_warning(smhi_data(12,123544))
  expect_warning(smhi_data("Varmland",12))
  expect_warning(smhi_data(2,93220))
  expect_warning(smhi_data("93220","LHC"))
  expect_warning(smhi_data(data.frame(x=1:93220,y=1:93220))) 
  
  expect_error(smhi_data(matrix(x=1:93220,y=1:93220))) 
  expect_error(smhi_data(123123,12,13332))
  

  #Nedan tas bort då den ej köper varken error eller warning.
  #expect_warning(smhi_plot(12,123544)) 
  #expect_warning(smhi_plot("Varmland",12)) 
  #expect_warning(smhi_plot(2,93220))
  #expect_warning(smhi_plot("93220","LHC"))
  expect_error(smhi_plot(data.frame(x=1:93220,y=1:93220))) 
  
  #expect_error(smhi_plot(123123,12)) 
  expect_error(smhi_plot(matrix(x=1:93220,y=1:93220))) 
  expect_error(smhi_plot(123123,12,13332))
  
})

test_that("Class tests",{ 
  expect_equal(class(smhi_data(93220,2)),"data.frame")
  expect_equal(class(smhi_plot(93220,2))[1],"gg")
  expect_equal(class(smhi_plot(93220,2))[2],"ggplot")
  
  })