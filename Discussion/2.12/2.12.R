"""
2.12 Discussion 
Yijun Kim
"""

# Creating new table
new_table <- data.frame(a = sample(1:50, 20),
                        b = sample(1:50, 20),
                        c = sample(1:50, 20),
                        d = sample(1:50, 20))

View(new_table)

#Histogram with lines
hist(new_table$a, freq= F)
lines(density(new_table$a))

#Boxplot
boxplot(new_table$a, ylab = "20 Random numbers between 1 and 50")

#ggplots
#fail to add a legend as it is numerical variables without categories
par(mfrow=c(2,2))
plot(new_table$a)
plot(new_table$b)
plot(new_table$c)
plot(new_table$d)

ggplot(mapping = aes(x = a, y = b), data = new_table) + 
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~c)

#ggplots with a legend
p <- ggplot(mtcars, aes(wt, mpg))
p + geom_point(aes(colour = factor(cyl)), size = 4)

#saving in png
png("test1.png")
hist(new_table$a, freq= F)
lines(density(new_table$a))

#dotchart and pairs
dotchart(new_table$a)
pairs(new_table[, c("a", "b")], panel = panel.smooth)


