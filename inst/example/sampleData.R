# Simple timeline with 4 items
dataBasic <- data.frame(
  id = 1:4,
  content = c("Item one", "Item two" ,"Ranged item", "Item four"),
  start   = c("2016-01-10", "2016-01-11", "2016-01-20", "2016-02-14"),
  end    = c(NA, NA, "2016-02-04", NA)
)

countryToCode <- list(
  "Argentina" = "ar",
  "Belgium" = "be",
  "Brazil" = "br",
  "Colombia" = "co",
  "Costa Rica" = "cr",
  "France" = "fr",
  "Germany" = "de",
  "Netherlands" = "nl"
)

# Template for world cup HTML of each item
templateWC <- function(stage, team1, team2, score1, score2) {
  sprintf(
    '<table><tbody>
      <tr><td colspan="3"><em>%s</em></td></tr>
      <tr>
        <td>%s</td>
        <th>&nbsp;%s - %s&nbsp;</th>
        <td>%s</td>
      </tr>
      <tr>
        <td><img src="https://flagpedia.net/data/flags/mini/%s.png" width="31" height="20" alt="%s"></td>
        <th></th>
        <td><img src="https://flagpedia.net/data/flags/mini/%s.png" width="31" height="20" alt="%s"></td>
      </tr>
    </tbody></table>',
    stage, team1, score1, score2, team2, countryToCode[[team1]], team1, countryToCode[[team2]], team2
  )
}

# Data for world cup 2014
dataWC <- data.frame(
  id = 1:7,
  start = c(
    "2014-07-04 13:00",
    "2014-07-04 17:00",
    "2014-07-05 13:00",
    "2014-07-05 17:00",
    "2014-07-08 17:00",
    "2014-07-09 17:00",
    "2014-07-13 16:00"
  ),
  content = c(
    templateWC("quarter-finals", "France", "Germany", 0, 1),
    templateWC("quarter-finals", "Brazil", "Colombia", 2, 1),
    templateWC("quarter-finals", "Argentina", "Belgium", 1, 0),
    templateWC("quarter-finals", "Netherlands", "Costa Rica", "0 (4)", "0 (3)"),
    templateWC("semi-finals", "Brazil", "Germany", 1, 7),
    templateWC("semi-finals", "Netherlands", "Argentina", "0 (2)", "0 (4)"),
    templateWC("final", "Germany", "Argentina", 1, 0)
  )
)

# Data for groups example (this data also gets exported in the package)
timevisData <- data.frame(
  id = 1:11,
  content = c("Open", "Open",
              "Open", "Open", "Half price entry",
              "Staff meeting", "Open", "Adults only", "Open", "Hot tub closes",
              "Siesta"),
  start = c("2016-05-01 07:30:00", "2016-05-01 14:00:00",
            "2016-05-01 06:00:00", "2016-05-01 14:00:00", "2016-05-01 08:00:00",
            "2016-05-01 08:00:00", "2016-05-01 08:30:00", "2016-05-01 14:00:00",
            "2016-05-01 16:00:00", "2016-05-01 19:30:00",
            "2016-05-01 12:00:00"),
  end   = c("2016-05-01 12:00:00", "2016-05-01 20:00:00",
            "2016-05-01 12:00:00", "2016-05-01 22:00:00", "2016-05-01 10:00:00",
            "2016-05-01 08:30:00", "2016-05-01 12:00:00", "2016-05-01 16:00:00",
            "2016-05-01 20:00:00", NA,
            "2016-05-01 14:00:00"),
  group = c(rep("lib", 2), rep("gym", 3), rep("pool", 5), NA),
  type = c(rep("range", 9), "point", "background")
)
timevisDataGroups <- data.frame(
  id = c("lib", "gym", "pool"),
  content = c("Library", "Gym", "Pool")
)


#https://visjs.github.io/vis-timeline/examples/timeline/groups/nestedGroups.html
timevisNestedGroups= function(){
## Lazy
jsonlite::fromJSON(
'
[
  {
    "id": 1,
    "content": "Lee",
    "nestedGroups": [
      11,
      12,
      13
    ],
    "showNested": true
  },
  {
    "id": 2,
    "content": "invisible group",
    "visible": false
  },
  {
    "id": 3,
    "content": "John",
    "nestedGroups": [
      14
    ],
    "showNested": true
  },
  {
    "id": 4,
    "content": "Alson"
  },
  {
    "id": 11,
    "content": "cook",
    "nestedInGroup": 1,
    "visible": true
  },
  {
    "id": 12,
    "content": "shop",
    "nestedInGroup": 1,
    "visible": true
  },
  {
    "id": 13,
    "content": "clean house",
    "nestedInGroup": 1,
    "visible": true
  },
  {
    "id": 14,
    "content": "wash dishes",
    "nestedInGroup": 3,
    "visible": true
  }
]
')}


timevisNestedData= function(){
## Lazy
jsonlite::fromJSON(
'
[
  {
    "id": 0,
    "group": 11,
    "content": "item 0",
    "start": "2022-10-10T16:48:48.720Z",
    "end": "2022-10-10T18:48:48.720Z",
    "type": "point"
  },
  {
    "id": 1,
    "group": 12,
    "content": "item 1",
    "start": "2022-10-05T12:39:10.256Z",
    "end": "2022-10-05T14:39:10.256Z",
    "type": "point"
  },
  {
    "id": 2,
    "group": 12,
    "content": "item 2",
    "start": "2022-10-11T00:43:34.854Z",
    "end": "2022-10-11T02:43:34.854Z",
    "type": "box"
  },
  {
    "id": 3,
    "group": 13,
    "content": "item 3",
    "start": "2022-10-07T19:11:08.984Z",
    "end": "2022-10-07T21:11:08.984Z",
    "type": "box"
  },
  {
    "id": 4,
    "group": 3,
    "content": "item 4",
    "start": "2022-10-06T03:41:28.702Z",
    "end": "2022-10-06T05:41:28.702Z",
    "type": "box"
  },
  {
    "id": 5,
    "group": 11,
    "content": "item 5",
    "start": "2022-10-04T10:03:09.508Z",
    "end": "2022-10-04T12:03:09.508Z",
    "type": "background"
  },
  {
    "id": 6,
    "group": 3,
    "content": "item 6",
    "start": "2022-10-04T03:16:23.812Z",
    "end": "2022-10-04T05:16:23.812Z",
    "type": "box"
  },
  {
    "id": 7,
    "group": 14,
    "content": "item 7",
    "start": "2022-10-07T21:19:03.980Z",
    "end": "2022-10-07T23:19:03.980Z",
    "type": "box"
  },
  {
    "id": 8,
    "group": 1,
    "content": "item 8",
    "start": "2022-10-12T00:48:48.483Z",
    "end": "2022-10-12T02:48:48.483Z",
    "type": "range"
  },
  {
    "id": 9,
    "group": 11,
    "content": "item 9",
    "start": "2022-10-05T03:35:15.416Z",
    "end": "2022-10-05T05:35:15.416Z",
    "type": "range"
  },
  {
    "id": 10,
    "group": 12,
    "content": "item 10",
    "start": "2022-10-04T22:17:50.829Z",
    "end": "2022-10-05T00:17:50.829Z",
    "type": "range"
  },
  {
    "id": 11,
    "group": 4,
    "content": "item 11",
    "start": "2022-10-07T13:47:22.536Z",
    "end": "2022-10-07T15:47:22.536Z",
    "type": "point"
  },
  {
    "id": 12,
    "group": 4,
    "content": "item 12",
    "start": "2022-10-04T01:11:26.825Z",
    "end": "2022-10-04T03:11:26.825Z",
    "type": "box"
  },
  {
    "id": 13,
    "group": 2,
    "content": "item 13",
    "start": "2022-10-06T01:22:31.669Z",
    "end": "2022-10-06T03:22:31.669Z",
    "type": "point"
  },
  {
    "id": 14,
    "group": 11,
    "content": "item 14",
    "start": "2022-10-11T20:48:21.073Z",
    "end": "2022-10-11T22:48:21.073Z",
    "type": "range"
  },
  {
    "id": 15,
    "group": 12,
    "content": "item 15",
    "start": "2022-10-06T12:17:59.405Z",
    "end": "2022-10-06T14:17:59.405Z",
    "type": "range"
  },
  {
    "id": 16,
    "group": 14,
    "content": "item 16",
    "start": "2022-10-11T00:51:01.940Z",
    "end": "2022-10-11T02:51:01.940Z",
    "type": "point"
  },
  {
    "id": 17,
    "group": 11,
    "content": "item 17",
    "start": "2022-10-04T12:16:36.588Z",
    "end": "2022-10-04T14:16:36.588Z",
    "type": "box"
  },
  {
    "id": 18,
    "group": 2,
    "content": "item 18",
    "start": "2022-10-11T02:21:27.579Z",
    "end": "2022-10-11T04:21:27.579Z",
    "type": "background"
  },
  {
    "id": 19,
    "group": 1,
    "content": "item 19",
    "start": "2022-10-04T17:16:31.619Z",
    "end": "2022-10-04T19:16:31.619Z",
    "type": "point"
  },
  {
    "id": 20,
    "group": 13,
    "content": "item 20",
    "start": "2022-10-11T02:12:11.246Z",
    "end": "2022-10-11T04:12:11.246Z",
    "type": "background"
  },
  {
    "id": 21,
    "group": 4,
    "content": "item 21",
    "start": "2022-10-06T05:24:33.376Z",
    "end": "2022-10-06T07:24:33.376Z",
    "type": "box"
  },
  {
    "id": 22,
    "group": 11,
    "content": "item 22",
    "start": "2022-10-04T07:03:10.211Z",
    "end": "2022-10-04T09:03:10.211Z",
    "type": "point"
  },
  {
    "id": 23,
    "group": 1,
    "content": "item 23",
    "start": "2022-10-03T23:24:20.573Z",
    "end": "2022-10-04T01:24:20.573Z",
    "type": "range"
  },
  {
    "id": 24,
    "group": 12,
    "content": "item 24",
    "start": "2022-10-04T19:59:04.791Z",
    "end": "2022-10-04T21:59:04.791Z",
    "type": "point"
  },
  {
    "id": 25,
    "group": 14,
    "content": "item 25",
    "start": "2022-10-04T08:24:35.129Z",
    "end": "2022-10-04T10:24:35.129Z",
    "type": "box"
  },
  {
    "id": 26,
    "group": 12,
    "content": "item 26",
    "start": "2022-10-09T13:56:55.118Z",
    "end": "2022-10-09T15:56:55.118Z",
    "type": "box"
  },
  {
    "id": 27,
    "group": 2,
    "content": "item 27",
    "start": "2022-10-04T08:06:15.088Z",
    "end": "2022-10-04T10:06:15.088Z",
    "type": "box"
  },
  {
    "id": 28,
    "group": 4,
    "content": "item 28",
    "start": "2022-10-08T22:18:15.694Z",
    "end": "2022-10-09T00:18:15.694Z",
    "type": "background"
  },
  {
    "id": 29,
    "group": 14,
    "content": "item 29",
    "start": "2022-10-11T17:52:10.830Z",
    "end": "2022-10-11T19:52:10.830Z",
    "type": "box"
  },
  {
    "id": 30,
    "group": 3,
    "content": "item 30",
    "start": "2022-10-04T16:04:12.107Z",
    "end": "2022-10-04T18:04:12.107Z",
    "type": "range"
  },
  {
    "id": 31,
    "group": 1,
    "content": "item 31",
    "start": "2022-10-10T05:12:53.350Z",
    "end": "2022-10-10T07:12:53.350Z",
    "type": "point"
  },
  {
    "id": 32,
    "group": 1,
    "content": "item 32",
    "start": "2022-10-09T03:12:02.333Z",
    "end": "2022-10-09T05:12:02.333Z",
    "type": "box"
  },
  {
    "id": 33,
    "group": 14,
    "content": "item 33",
    "start": "2022-10-06T00:47:36.484Z",
    "end": "2022-10-06T02:47:36.484Z",
    "type": "range"
  },
  {
    "id": 34,
    "group": 3,
    "content": "item 34",
    "start": "2022-10-10T02:51:36.511Z",
    "end": "2022-10-10T04:51:36.511Z",
    "type": "range"
  },
  {
    "id": 35,
    "group": 11,
    "content": "item 35",
    "start": "2022-10-04T11:32:04.177Z",
    "end": "2022-10-04T13:32:04.177Z",
    "type": "point"
  },
  {
    "id": 36,
    "group": 14,
    "content": "item 36",
    "start": "2022-10-09T08:20:01.732Z",
    "end": "2022-10-09T10:20:01.732Z",
    "type": "background"
  },
  {
    "id": 37,
    "group": 4,
    "content": "item 37",
    "start": "2022-10-11T16:14:00.827Z",
    "end": "2022-10-11T18:14:00.827Z",
    "type": "box"
  },
  {
    "id": 38,
    "group": 4,
    "content": "item 38",
    "start": "2022-10-11T10:35:18.859Z",
    "end": "2022-10-11T12:35:18.859Z",
    "type": "point"
  },
  {
    "id": 39,
    "group": 1,
    "content": "item 39",
    "start": "2022-10-07T02:26:20.864Z",
    "end": "2022-10-07T04:26:20.864Z",
    "type": "point"
  },
  {
    "id": 40,
    "group": 12,
    "content": "item 40",
    "start": "2022-10-08T09:41:29.131Z",
    "end": "2022-10-08T11:41:29.131Z",
    "type": "point"
  },
  {
    "id": 41,
    "group": 2,
    "content": "item 41",
    "start": "2022-10-09T22:32:26.866Z",
    "end": "2022-10-10T00:32:26.866Z",
    "type": "box"
  },
  {
    "id": 42,
    "group": 3,
    "content": "item 42",
    "start": "2022-10-06T01:32:51.900Z",
    "end": "2022-10-06T03:32:51.900Z",
    "type": "background"
  },
  {
    "id": 43,
    "group": 2,
    "content": "item 43",
    "start": "2022-10-06T12:23:16.320Z",
    "end": "2022-10-06T14:23:16.320Z",
    "type": "range"
  },
  {
    "id": 44,
    "group": 12,
    "content": "item 44",
    "start": "2022-10-11T10:44:10.976Z",
    "end": "2022-10-11T12:44:10.976Z",
    "type": "range"
  },
  {
    "id": 45,
    "group": 12,
    "content": "item 45",
    "start": "2022-10-11T10:06:01.995Z",
    "end": "2022-10-11T12:06:01.995Z",
    "type": "point"
  },
  {
    "id": 46,
    "group": 4,
    "content": "item 46",
    "start": "2022-10-10T20:16:18.761Z",
    "end": "2022-10-10T22:16:18.761Z",
    "type": "background"
  },
  {
    "id": 47,
    "group": 13,
    "content": "item 47",
    "start": "2022-10-04T16:43:42.113Z",
    "end": "2022-10-04T18:43:42.113Z",
    "type": "box"
  },
  {
    "id": 48,
    "group": 11,
    "content": "item 48",
    "start": "2022-10-07T01:03:16.945Z",
    "end": "2022-10-07T03:03:16.945Z",
    "type": "range"
  },
  {
    "id": 49,
    "group": 11,
    "content": "item 49",
    "start": "2022-10-10T03:11:52.613Z",
    "end": "2022-10-10T05:11:52.613Z",
    "type": "range"
  },
  {
    "id": 50,
    "group": 1,
    "content": "item 50",
    "start": "2022-10-07T01:31:10.532Z",
    "end": "2022-10-07T03:31:10.532Z",
    "type": "background"
  },
  {
    "id": 51,
    "group": 4,
    "content": "item 51",
    "start": "2022-10-07T10:35:41.832Z",
    "end": "2022-10-07T12:35:41.832Z",
    "type": "point"
  },
  {
    "id": 52,
    "group": 13,
    "content": "item 52",
    "start": "2022-10-05T07:34:28.839Z",
    "end": "2022-10-05T09:34:28.839Z",
    "type": "range"
  },
  {
    "id": 53,
    "group": 13,
    "content": "item 53",
    "start": "2022-10-06T21:29:55.181Z",
    "end": "2022-10-06T23:29:55.181Z",
    "type": "range"
  },
  {
    "id": 54,
    "group": 4,
    "content": "item 54",
    "start": "2022-10-04T19:37:05.645Z",
    "end": "2022-10-04T21:37:05.645Z",
    "type": "background"
  },
  {
    "id": 55,
    "group": 12,
    "content": "item 55",
    "start": "2022-10-08T03:13:40.471Z",
    "end": "2022-10-08T05:13:40.471Z",
    "type": "range"
  },
  {
    "id": 56,
    "group": 1,
    "content": "item 56",
    "start": "2022-10-05T12:40:33.004Z",
    "end": "2022-10-05T14:40:33.004Z",
    "type": "range"
  },
  {
    "id": 57,
    "group": 4,
    "content": "item 57",
    "start": "2022-10-07T04:00:53.361Z",
    "end": "2022-10-07T06:00:53.361Z",
    "type": "point"
  },
  {
    "id": 58,
    "group": 3,
    "content": "item 58",
    "start": "2022-10-09T17:02:57.342Z",
    "end": "2022-10-09T19:02:57.342Z",
    "type": "box"
  },
  {
    "id": 59,
    "group": 1,
    "content": "item 59",
    "start": "2022-10-05T17:06:22.600Z",
    "end": "2022-10-05T19:06:22.600Z",
    "type": "box"
  }
]
')}
