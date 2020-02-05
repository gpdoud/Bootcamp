# Update & Display Stock Prices

This project is to display a list of stocks and update the current price of any of those stocks.

The program starts with a pre-defined list of stocks stored in a json file.

    {
        PG: {
            name: "P & G",
            location: "Cincinnati, OH",
            currPrice: 126.41,
            paidPrice: 125.11,
            shares: 10
        },
        MSFT: {
            name: "Microsoft",
            location: "Redmond, WA",
            currPrice: 167.10,
            paidPrice: 162.34,
            shares: 100
        },
        AMZN: {
            name: "Amazon",
            location: "Bellevue, WA",
            currPrice: 1884.12,
            paidPrice: 1888.33,
            shares: 2
        }
    }

## Functionality

The user can add new stocks or remove existing stocks from the list when they buy or sell a stock. The user will routinely update the current price of each stock. There is no need to be able to update the name or location as it does not change. The user may also change the number of shares of the stock as they buy more or sell shares.

The main display will always show a list of the stocks in the traditional list format:

| Symbol | Name | Location | Current | Paid | Gain/loss | Shares | Value |
| :---:  | --- | --- | ---: | ---: | ---: | ---: | ---: | ---: |
| PG | P&G | Cincinnati, OH | 126.41 | 125.11 | +1.30 | 10 | 1264.10 |
| MSFT | Microsoft | Redmond, WA | 167.10 | 162.34 | +4.76 | 100 | 12710.00 |
| AMZN | Amazon | Bellevue, WA | 1884.72 | 1888.33 | -4.21 | 2 | 3769.44 |

## Styling

The Gain/loss calculated value must in Green text if it is a positive number and Red text if it is a negative number