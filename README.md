# Hot Date

Take your JavaScript out on a hot date! Hot Date is an experimental library that
implements Rails-style durations and date calculations in JavaScript.

## Basics

### Create Durations
```javascript
(50).minutes()
(1).hour()
(5).days()
(3).weeks()
(4).months()
(1).year()
```

### The past and future
```javascript
(5).days().ago()
(8).years().ago()
(1).month().fromNow()
(6).hours().fromNow()
```

### Math with dates!
```javascript
date = new Date(2015, 2, 11, 10, 50, 10)
date.plus((5).days())
date.minus((4).months())
```

### Helpful accessors
```javascript
> duration = (1).year()
> duration.years()
1
> duration.months()
12
> duration.weeks()
52.142857142857146
> duration.days()
365
> duration.hours()
8760
> duration.minutes()
525600
> duration.seconds()
31536000
> duration.milliseconds()
31536000000
```