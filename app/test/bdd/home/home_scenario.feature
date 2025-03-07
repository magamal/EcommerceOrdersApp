Feature: Home Scenarios

  Scenario: home success get data scenario
    Given Setup Data
    And the orders json file will return
      | 'id'                       | 'price'      | 'buyer'            | 'status'    | 'registered'                 |
      | '617ec83315ac5cc039950494' | '\$3,164.16' | 'Katrina Lamb'     | 'ORDERED'   | '2021-05-15T12:48:03 -02:00' |
      | '617ec8333eee751d6150968c' | '\$2,599.06' | 'Perkins Huber'    | 'DELIVERED' | '2021-04-11T04:24:23 -02:00' |
      | '617ec833f12904d46ae13ea7' | '\$3,778.80' | 'Hopper Velasquez' | 'RETURNED'  | '2021-07-02T04:56:54 -02:00' |
      | '617ec833d9a7fc38137bf0d2' | '\$3,565.77' | 'Monroe Dawson'    | 'ORDERED'   | '2021-10-06T04:14:33 -02:00' |
      | '617ec8332f0aedb699922145' | '\$3,040.14' | 'Frye Waters'      | 'RETURNED'  | '2021-08-05T01:02:51 -02:00' |
      | '617ec833ea72ff322bffdb6f' | '\$3,619.55' | 'Whitney Soto'     | 'DELIVERED' | '2021-03-26T10:12:31 -02:00' |
      | '617ec833baf04be83f2df2f4' | '\$3,411.23' | 'Robert Barlow'    | 'DELIVERED' | '2021-10-31T07:37:06 -02:00' |
      | '617ec833d35b370ce8e97e3e' | '\$3,208.58' | 'Deborah Taylor'   | 'DELIVERED' | '2021-08-13T08:08:01 -02:00' |
      | '617ec8339875e53aa32b8b61' | '\$2,587.72' | 'Holman Sims'      | 'DELIVERED' | '2021-07-08T05:32:24 -02:00' |
      | '617ec83399d75f6a63db32f3' | '\$3,979.80' | 'Florine Mccarty'  | 'ORDERED'   | '2021-01-10T06:33:51 -02:00' |
      | '617ec8337b2c350bcc85b3ee' | '\$3,825.58' | 'Marcella Hurst'   | 'DELIVERED' | '2021-02-04T06:53:22 -02:00' |
      | '617ec83364d669728d7ab2f3' | '\$1,801.06' | 'Pugh Powers'      | 'DELIVERED' | '2021-04-26T10:48:22 -02:00' |
      | '617ec8339a5adf34be3853f6' | '\$2,163.85' | 'Roy Haley'        | 'DELIVERED' | '2021-01-03T02:10:26 -02:00' |
      | '617ec8337ca506b62b3d3198' | '\$1,560.75' | 'Ruth Underwood'   | 'RETURNED'  | '2021-02-22T05:39:01 -02:00' |
    Given the app is running
    Then the user could see {'14'} total orders
    And average price is {'3022'}
    And returned orders is {'3'}
    When the user taps {'Show graph'}
    Then the user will navigated to {'Graph'} page

  Scenario: home error get data scenario
    Given Setup Data
    And the orders json file is corrupted
    Given the app is running
    Then the user could see error {'Something went wrong'}