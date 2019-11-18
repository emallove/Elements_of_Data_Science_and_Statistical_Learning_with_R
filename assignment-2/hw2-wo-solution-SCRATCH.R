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

X11.options(width=10, height=100)
par(mfrow = c(2,2))

plot_lines <- function(m, l) {
  plot(   xlab = "Router #",
          ylab = "WiFi Signal Strength",
          main = paste("Signal Strength from Room ", l),
          x = rep(c(1,2,3,4,5,6,7), length(wifi_loc_data_matrix1) / 7),
          y = wifi_loc_data_matrix1[,-8],
          type = 'n')

  colors <- terrain.colors(nrow(m))
  i = 1
  for (r in 1:nrow(m)) {
      line_ <- c()
      for (c in 1:ncol(m)) {
         line_ = append(line_, m[r,c])
      }
      lines(1:7, line_, col=colors[i])
      i = i + 1
  }
}

# points( x = rep(c(1,2,3,4,5,6,7), length(wifi_loc_data_matrix1) / 7),
#         y = wifi_loc_data_matrix1[,-8],
#         pch = 1)

# Create the loop with r and c to iterate over the matrix

plot_lines(wifi_loc_data_matrix1, "1")
plot_lines(wifi_loc_data_matrix2, "2")
plot_lines(wifi_loc_data_matrix3, "3")
plot_lines(wifi_loc_data_matrix4, "4")

