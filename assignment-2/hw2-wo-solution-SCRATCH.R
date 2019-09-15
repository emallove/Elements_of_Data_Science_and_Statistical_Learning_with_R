# Put router number (1-7) on the x-axis, with corresponding signal strength on the y-axis.
# Break the scatter plots into four separate graphs: Room 1-4

# chop off last column which lists Room #
wifi_loc_data_matrix = matrix(scan("wifi_localization.txt"), ncol = 8, byrow = TRUE)
wifi_loc_data_matrix1 = matrix(wifi_loc_data_matrix[wifi_loc_data_matrix[,8] == 1], ncol = 8)
wifi_loc_data_matrix2 = matrix(wifi_loc_data_matrix[wifi_loc_data_matrix[,8] == 2], ncol = 8)
wifi_loc_data_matrix3 = matrix(wifi_loc_data_matrix[wifi_loc_data_matrix[,8] == 3], ncol = 8)
wifi_loc_data_matrix4 = matrix(wifi_loc_data_matrix[wifi_loc_data_matrix[,8] == 4], ncol = 8)

# chop off last column which lists Room #
wifi_loc_data_matrix1 = wifi_loc_data_matrix1[,-8]
wifi_loc_data_matrix2 = wifi_loc_data_matrix2[,-8]
wifi_loc_data_matrix3 = wifi_loc_data_matrix3[,-8]
wifi_loc_data_matrix4 = wifi_loc_data_matrix4[,-8]

# plot( x = matrix(), y = matrix(), 
#       xlab = "Router #",
#       ylab = "WiFi Signal Strength",
#       main = "WiFi Signal Strengths when device is located in Room 1")

plot(   xlab = "Router #",
        ylab = "WiFi Signal Strength",
        main = "WiFi Signal Strengths when device is located in Room 1",
        x = rep(c(1,2,3,4,5,6,7), length(wifi_loc_data_matrix1) / 7),
        y = wifi_loc_data_matrix1[,-8],
        type = 'n')

points( x = rep(c(1,2,3,4,5,6,7), length(wifi_loc_data_matrix1) / 7),
        y = wifi_loc_data_matrix1[,-8],
        pch = 1)

points( x = rep(c(1.25,2.25,3.25,4.25,5.25,6.25,7.25), length(wifi_loc_data_matrix2) / 7),
        y = wifi_loc_data_matrix2[,-8],
        pch = 2)

points( x = rep(c(1.5,2.5,3.5,4.5,5.5,6.5,7.5), length(wifi_loc_data_matrix3) / 7),
        y = wifi_loc_data_matrix3[,-8],
        pch = 3)

points( x = rep(c(1.75,2.75,3.75,4.75,5.75,6.75,7.75), length(wifi_loc_data_matrix4) / 7),
        y = wifi_loc_data_matrix4[,-8],
        pch = 4)

# plot(x = rep(c(1,2,3,4,5,6,7), 3),
#       y = wifi_loc_data_matrix2[,-8],
#       xlab = "Router #",
#       ylab = "WiFi Signal Strength",
#       main = "WiFi Signal Strengths when device is located in Room 2")

# colnames(m) <- c(purrr::map(1:7, purrr::map(1:3, function(x) paste("W", x)))
colnames(m) <- c("W1", "W2", "W3", "W4", "W5", "W6", "W7", "Room")

