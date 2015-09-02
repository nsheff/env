d = read.table("workrave.out")
pdf("workRavePlot.pdf")
par(mfrow=c(2,1))
timeline = as.Date(paste(substr(d$V1, 1, 4), substr(d$V1, 5,6), substr(d$V1, 7,8), sep="-"))
completeTimeline = seq(min(timeline), max(timeline), by=1)
mouseClicks = rep(0, length(completeTimeline));
mouseClicks[completeTimeline %in% timeline] = d$V27
keystrokes = rep(0, length(completeTimeline));
keystrokes[completeTimeline %in% timeline] = d$V28

setdiff(completeTimeline, timeline)

plot(completeTimeline, mouseClicks, main="Mouse clicks", type="b", pch=16)
plot(completeTimeline, keystrokes, main="Keystrokes", type="b", pch=16)
dev.off()
cat("Output workRavePlot.pdf");
