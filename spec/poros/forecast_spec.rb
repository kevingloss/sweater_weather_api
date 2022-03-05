require 'rails_helper'

RSpec.describe Forecast do 
  before :each do 
    @data = {
          "current": {
            "dt": 1646519437,
            "sunrise": 1646478799,
            "sunset": 1646519906,
            "temp": 39.24,
            "feels_like": 32.54,
            "pressure": 1029,
            "humidity": 41,
            "dew_point": 19.15,
            "uvi": 0,
            "clouds": 100,
            "visibility": 10000,
            "wind_speed": 10.36,
            "wind_deg": 230,
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ]
          },
          "hourly": [
              {
                "dt": 1646517600,
                "temp": 38.46,
                "feels_like": 38.46,
                "pressure": 1029,
                "humidity": 45,
                "dew_point": 20.44,
                "uvi": 0,
                "clouds": 100,
                "visibility": 10000,
                "wind_speed": 2.37,
                "wind_deg": 199,
                "wind_gust": 2.42,
                "weather": [
                    {
                        "id": 804,
                        "main": "Clouds",
                        "description": "overcast clouds",
                        "icon": "04d"
                    }
                ],
                "pop": 0
              },
              {
                "dt": 1646521200,
                "temp": 39.24,
                "feels_like": 35.58,
                "pressure": 1029,
                "humidity": 41,
                "dew_point": 19.15,
                "uvi": 0,
                "clouds": 100,
                "visibility": 10000,
                "wind_speed": 4.99,
                "wind_deg": 193,
                "wind_gust": 7.99,
                "weather": [
                    {
                        "id": 804,
                        "main": "Clouds",
                        "description": "overcast clouds",
                        "icon": "04n"
                    }
                ],
                "pop": 0
              },
              {
                "dt": 1646524800,
                "temp": 37.92,
                "feels_like": 32.95,
                "pressure": 1029,
                "humidity": 46,
                "dew_point": 20.46,
                "uvi": 0,
                "clouds": 100,
                "visibility": 10000,
                "wind_speed": 6.49,
                "wind_deg": 195,
                "wind_gust": 15.61,
                "weather": [
                    {
                        "id": 804,
                        "main": "Clouds",
                        "description": "overcast clouds",
                        "icon": "04n"
                    }
                ],
                "pop": 0
              },
              {
                "dt": 1646528400,
                "temp": 36.5,
                "feels_like": 30.9,
                "pressure": 1030,
                "humidity": 51,
                "dew_point": 21.45,
                "uvi": 0,
                "clouds": 100,
                "visibility": 10000,
                "wind_speed": 7.02,
                "wind_deg": 204,
                "wind_gust": 20.74,
                "weather": [
                    {
                        "id": 804,
                        "main": "Clouds",
                        "description": "overcast clouds",
                        "icon": "04n"
                    }
                ],
                "pop": 0
              },
              {
                "dt": 1646532000,
                "temp": 35.56,
                "feels_like": 29.14,
                "pressure": 1030,
                "humidity": 54,
                "dew_point": 21.87,
                "uvi": 0,
                "clouds": 100,
                "visibility": 10000,
                "wind_speed": 8.08,
                "wind_deg": 200,
                "wind_gust": 23.62,
                "weather": [
                    {
                        "id": 804,
                        "main": "Clouds",
                        "description": "overcast clouds",
                        "icon": "04n"
                    }
                ],
                "pop": 0
              },
              {
                "dt": 1646535600,
                "temp": 34.66,
                "feels_like": 28.29,
                "pressure": 1030,
                "humidity": 61,
                "dew_point": 23.68,
                "uvi": 0,
                "clouds": 100,
                "visibility": 10000,
                "wind_speed": 7.65,
                "wind_deg": 203,
                "wind_gust": 25.57,
                "weather": [
                    {
                        "id": 804,
                        "main": "Clouds",
                        "description": "overcast clouds",
                        "icon": "04n"
                    }
                ],
                "pop": 0
              },
              {
                "dt": 1646539200,
                "temp": 34.07,
                "feels_like": 27.46,
                "pressure": 1029,
                "humidity": 68,
                "dew_point": 24.44,
                "uvi": 0,
                "clouds": 100,
                "visibility": 10000,
                "wind_speed": 7.85,
                "wind_deg": 201,
                "wind_gust": 27.74,
                "weather": [
                    {
                        "id": 804,
                        "main": "Clouds",
                        "description": "overcast clouds",
                        "icon": "04n"
                    }
                ],
                "pop": 0
              },
              {
                "dt": 1646542800,
                "temp": 34.74,
                "feels_like": 28.42,
                "pressure": 1028,
                "humidity": 71,
                "dew_point": 26.08,
                "uvi": 0,
                "clouds": 100,
                "visibility": 10000,
                "wind_speed": 7.61,
                "wind_deg": 194,
                "wind_gust": 28.39,
                "weather": [
                    {
                        "id": 804,
                        "main": "Clouds",
                        "description": "overcast clouds",
                        "icon": "04n"
                    }
                ],
                "pop": 0
              },
              {
                "dt": 1646546400,
                "temp": 34.9,
                "feels_like": 28.29,
                "pressure": 1028,
                "humidity": 75,
                "dew_point": 27.59,
                "uvi": 0,
                "clouds": 100,
                "visibility": 10000,
                "wind_speed": 8.14,
                "wind_deg": 183,
                "wind_gust": 29.59,
                "weather": [
                    {
                        "id": 804,
                        "main": "Clouds",
                        "description": "overcast clouds",
                        "icon": "04n"
                    }
                ],
                "pop": 0
              },
              {
                "dt": 1646550000,
                "temp": 35.26,
                "feels_like": 28.74,
                "pressure": 1026,
                "humidity": 78,
                "dew_point": 28.9,
                "uvi": 0,
                "clouds": 100,
                "visibility": 10000,
                "wind_speed": 8.12,
                "wind_deg": 178,
                "wind_gust": 30.67,
                "weather": [
                    {
                        "id": 804,
                        "main": "Clouds",
                        "description": "overcast clouds",
                        "icon": "04n"
                    }
                ],
                "pop": 0
              }
          ],
          "daily": [
              {
                "dt": 1646496000,
                "sunrise": 1646478799,
                "sunset": 1646519906,
                "moonrise": 1646484660,
                "moonset": 1646532060,
                "moon_phase": 0.1,
                "temp": {
                    "day": 33.85,
                    "min": 23.4,
                    "max": 39.24,
                    "night": 34.07,
                    "eve": 38.46,
                    "morn": 23.4
                },
                "feels_like": {
                    "day": 27.57,
                    "night": 27.46,
                    "eve": 38.46,
                    "morn": 15.85
                },
                "pressure": 1033,
                "humidity": 51,
                "dew_point": 17.37,
                "wind_speed": 8.08,
                "wind_deg": 200,
                "wind_gust": 27.74,
                "weather": [
                    {
                        "id": 804,
                        "main": "Clouds",
                        "description": "overcast clouds",
                        "icon": "04d"
                    }
                ],
                "clouds": 100,
                "pop": 0,
                "uvi": 2.82
              },
              {
                "dt": 1646582400,
                "sunrise": 1646565099,
                "sunset": 1646606377,
                "moonrise": 1646572380,
                "moonset": 1646622420,
                "moon_phase": 0.13,
                "temp": {
                    "day": 49.1,
                    "min": 34.74,
                    "max": 58.03,
                    "night": 57.63,
                    "eve": 56.64,
                    "morn": 38.01
                },
                "feels_like": {
                    "day": 43.18,
                    "night": 56.95,
                    "eve": 56.14,
                    "morn": 32.54
                },
                "pressure": 1014,
                "humidity": 95,
                "dew_point": 47.39,
                "wind_speed": 17.81,
                "wind_deg": 233,
                "wind_gust": 47.76,
                "weather": [
                    {
                        "id": 500,
                        "main": "Rain",
                        "description": "light rain",
                        "icon": "10d"
                    }
                ],
                "clouds": 100,
                "pop": 0.63,
                "rain": 0.52,
                "uvi": 1.89
              },
              {
                "dt": 1646668800,
                "sunrise": 1646651398,
                "sunset": 1646692848,
                "moonrise": 1646660220,
                "moonset": 1646712720,
                "moon_phase": 0.17,
                "temp": {
                    "day": 46.76,
                    "min": 43.56,
                    "max": 55.38,
                    "night": 54.77,
                    "eve": 47.08,
                    "morn": 45.36
                },
                "feels_like": {
                    "day": 45.07,
                    "night": 54.46,
                    "eve": 47.08,
                    "morn": 39.4
                },
                "pressure": 1012,
                "humidity": 72,
                "dew_point": 38.05,
                "wind_speed": 15.1,
                "wind_deg": 273,
                "wind_gust": 43.4,
                "weather": [
                    {
                        "id": 501,
                        "main": "Rain",
                        "description": "moderate rain",
                        "icon": "10d"
                    }
                ],
                "clouds": 100,
                "pop": 1,
                "rain": 6.08,
                "uvi": 2
              },
              {
                "dt": 1646755200,
                "sunrise": 1646737697,
                "sunset": 1646779319,
                "moonrise": 1646748240,
                "moonset": 0,
                "moon_phase": 0.2,
                "temp": {
                    "day": 40.78,
                    "min": 34.81,
                    "max": 57.13,
                    "night": 34.81,
                    "eve": 43.45,
                    "morn": 40.93
                },
                "feels_like": {
                    "day": 32.74,
                    "night": 30.56,
                    "eve": 37.29,
                    "morn": 32.83
                },
                "pressure": 1011,
                "humidity": 48,
                "dew_point": 22.33,
                "wind_speed": 18.45,
                "wind_deg": 252,
                "wind_gust": 45.79,
                "weather": [
                    {
                        "id": 500,
                        "main": "Rain",
                        "description": "light rain",
                        "icon": "10d"
                    }
                ],
                "clouds": 6,
                "pop": 1,
                "rain": 0.81,
                "uvi": 3.53
              },
              {
                "dt": 1646841600,
                "sunrise": 1646823996,
                "sunset": 1646865789,
                "moonrise": 1646836560,
                "moonset": 1646802900,
                "moon_phase": 0.23,
                "temp": {
                    "day": 36.59,
                    "min": 31.95,
                    "max": 43.56,
                    "night": 37.65,
                    "eve": 43.56,
                    "morn": 31.95
                },
                "feels_like": {
                    "day": 31.62,
                    "night": 31.05,
                    "eve": 38.32,
                    "morn": 26.38
                },
                "pressure": 1020,
                "humidity": 45,
                "dew_point": 17.06,
                "wind_speed": 9.35,
                "wind_deg": 220,
                "wind_gust": 26.87,
                "weather": [
                    {
                        "id": 804,
                        "main": "Clouds",
                        "description": "overcast clouds",
                        "icon": "04d"
                    }
                ],
                "clouds": 100,
                "pop": 0,
                "uvi": 2.76
              },
              {
                "dt": 1646928000,
                "sunrise": 1646910293,
                "sunset": 1646952259,
                "moonrise": 1646925180,
                "moonset": 1646893020,
                "moon_phase": 0.25,
                "temp": {
                    "day": 40.87,
                    "min": 33.31,
                    "max": 47.26,
                    "night": 36.19,
                    "eve": 47.26,
                    "morn": 34.18
                },
                "feels_like": {
                    "day": 36.93,
                    "night": 31.84,
                    "eve": 45.72,
                    "morn": 27.97
                },
                "pressure": 1024,
                "humidity": 29,
                "dew_point": 10.49,
                "wind_speed": 8.08,
                "wind_deg": 264,
                "wind_gust": 24.45,
                "weather": [
                    {
                        "id": 800,
                        "main": "Clear",
                        "description": "clear sky",
                        "icon": "01d"
                    }
                ],
                "clouds": 0,
                "pop": 0,
                "uvi": 0.24
              },
              {
                "dt": 1647014400,
                "sunrise": 1646996591,
                "sunset": 1647038729,
                "moonrise": 1647014280,
                "moonset": 1646982840,
                "moon_phase": 0.29,
                "temp": {
                    "day": 44.08,
                    "min": 34.84,
                    "max": 49.14,
                    "night": 41.9,
                    "eve": 49.14,
                    "morn": 34.84
                },
                "feels_like": {
                    "day": 39.69,
                    "night": 34.95,
                    "eve": 45.12,
                    "morn": 30.54
                },
                "pressure": 1020,
                "humidity": 67,
                "dew_point": 33.62,
                "wind_speed": 12.84,
                "wind_deg": 301,
                "wind_gust": 28.07,
                "weather": [
                    {
                        "id": 803,
                        "main": "Clouds",
                        "description": "broken clouds",
                        "icon": "04d"
                    }
                ],
                "clouds": 77,
                "pop": 0,
                "uvi": 1
              },
              {
                "dt": 1647100800,
                "sunrise": 1647082888,
                "sunset": 1647125199,
                "moonrise": 1647103800,
                "moonset": 1647072420,
                "moon_phase": 0.32,
                "temp": {
                    "day": 32.23,
                    "min": 29.53,
                    "max": 35.47,
                    "night": 29.53,
                    "eve": 33.96,
                    "morn": 31.05
                },
                "feels_like": {
                    "day": 22.48,
                    "night": 22.05,
                    "eve": 25.75,
                    "morn": 21.74
                },
                "pressure": 1021,
                "humidity": 23,
                "dew_point": -1.75,
                "wind_speed": 13.44,
                "wind_deg": 314,
                "wind_gust": 27.45,
                "weather": [
                    {
                        "id": 804,
                        "main": "Clouds",
                        "description": "overcast clouds",
                        "icon": "04d"
                    }
                ],
                "clouds": 100,
                "pop": 0,
                "uvi": 1
              }
          ]
    }
  end

  it 'has the correct keys' do 
    forecast = Forecast.new(@data)

    expect(forecast.current.keys).to eq([:datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon])
    expect(forecast.hourly.first.keys).to eq([:time, :temperature, :conditions, :icon])
    expect(forecast.daily.first.keys).to eq([:date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon])
  end

  it 'has correct values for current forecast' do 
    current_forecast = Forecast.new(@data).current

    expect(current_forecast[:datetime]).to eq("2022-03-05 15:30:37 -0700")
    expect(current_forecast[:sunrise]).to eq("2022-03-05 04:13:19 -0700")
    expect(current_forecast[:sunset]).to eq("2022-03-05 15:38:26 -0700")
    expect(current_forecast[:temperature]).to eq(39.24)
    expect(current_forecast[:feels_like]).to eq(32.54)
    expect(current_forecast[:humidity]).to eq(41)
    expect(current_forecast[:uvi]).to eq(0)
    expect(current_forecast[:visibility]).to eq(10000)
    expect(current_forecast[:conditions]).to eq('overcast clouds')
    expect(current_forecast[:icon]).to eq('04d')
  end

  it 'has correct values for hourly forecast' do 
    hourly_forecast = Forecast.new(@data).hourly

    expect(hourly_forecast.count).to eq(8)
    expect(hourly_forecast.first[:time]).to eq("15:00:00")
    expect(hourly_forecast.first[:temperature]).to eq(38.46)
    expect(hourly_forecast.first[:conditions]).to eq('overcast clouds')
    expect(hourly_forecast.first[:icon]).to eq('04d')
  end

  it 'has correct values for daily forecast' do 
    daily_forecast = Forecast.new(@data).daily

    expect(daily_forecast.count).to eq(5)
    expect(daily_forecast.first[:date]).to eq("2022-03-05")
    expect(daily_forecast.first[:sunrise]).to eq("2022-03-05 04:13:19 -0700")
    expect(daily_forecast.first[:sunset]).to eq("2022-03-05 15:38:26 -0700")
    expect(daily_forecast.first[:max_temp]).to eq(39.24)
    expect(daily_forecast.first[:min_temp]).to eq(23.4)
    expect(daily_forecast.first[:conditions]).to eq('overcast clouds')
    expect(daily_forecast.first[:icon]).to eq('04d')
  end
end