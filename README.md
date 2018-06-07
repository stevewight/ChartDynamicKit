# ChartDynamicKit
📈 Easily Create Hyper-Minimal Dynamic Charts 📉

## Usage
A dynamic chart is created through the ``ChartDynamicKit`` object.

###Instantiate###

```swift
var chartDynamic = ChartDynamicKit(
	line: minLine
)
```
*Note:* ``minLine`` is an ``@IBOutlet`` from the storyboard

###Set Data###

```swift
chartDynamic.set(data:myData)
```
*Note:* ``myData`` is an array of ``Double``'s

###Start###

```swift
chartDynamic.start()
```

Depending on your data, this will give you a chart that looks something like this:

![](images/basic-dynamic.gif)

###Delegate###

To get notified when the chart updates or to add a marker to the chart conform to the ``ChartDynamicDelegate``:

```swift
chartDynamic.delegate = self
```

The two methods available are:

####``chartDynamicUpdate(index:Int)``####
Called each time the chart changes

```swift
func chartDynamicUpdate(index: Int) {
	let value = myData[index]
	updateUI(value)
}
```

####``chartDynamicMarkerTag(index: Int)->MarkerTag?``####
To pass a marker if the ``index`` requires it (or ``nil``)

```swift
func chartDynamicMarkerTag(index: Int)->MarkerTag? {
	let value = myData[index]
	if shouldBeMarked(value) {
		return MarkerTag(name:"Hello", value:value)
	} else { return nil }
}
```

Depending on your data and how your ``shouldBeMarked(value)`` method is implemented, your chart will look something like this:

![](images/marker-dynamic.gif)

## Installation

## Pre-Release Version

## License
