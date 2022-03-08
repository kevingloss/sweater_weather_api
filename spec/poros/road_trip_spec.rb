require 'rails_helper'

RSpec.describe RoadTrip do 
  let(:forecast) {{
      "hourly": [
        {
            "dt": 1646758800,
            "temp": 41.58,
            "feels_like": 33.21,
            "pressure": 1015,
            "humidity": 39,
            "dew_point": 19.99,
            "uvi": 3.45,
            "clouds": 20,
            "visibility": 10000,
            "wind_speed": 17.36,
            "wind_deg": 304,
            "wind_gust": 29.75,
            "weather": [
                {
                    "id": 801,
                    "main": "Clouds",
                    "description": "few clouds",
                    "icon": "02d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1646762400,
            "temp": 41.38,
            "feels_like": 33.24,
            "pressure": 1015,
            "humidity": 37,
            "dew_point": 18.75,
            "uvi": 3,
            "clouds": 19,
            "visibility": 10000,
            "wind_speed": 16.24,
            "wind_deg": 305,
            "wind_gust": 26.44,
            "weather": [
                {
                    "id": 801,
                    "main": "Clouds",
                    "description": "few clouds",
                    "icon": "02d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1646766000,
            "temp": 41.43,
            "feels_like": 33.51,
            "pressure": 1015,
            "humidity": 36,
            "dew_point": 18.21,
            "uvi": 2.18,
            "clouds": 15,
            "visibility": 10000,
            "wind_speed": 15.55,
            "wind_deg": 307,
            "wind_gust": 24.61,
            "weather": [
                {
                    "id": 801,
                    "main": "Clouds",
                    "description": "few clouds",
                    "icon": "02d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1646769600,
            "temp": 41.49,
            "feels_like": 34.07,
            "pressure": 1016,
            "humidity": 34,
            "dew_point": 17.1,
            "uvi": 1.2,
            "clouds": 13,
            "visibility": 10000,
            "wind_speed": 13.94,
            "wind_deg": 306,
            "wind_gust": 22.06,
            "weather": [
                {
                    "id": 801,
                    "main": "Clouds",
                    "description": "few clouds",
                    "icon": "02d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1646773200,
            "temp": 41.13,
            "feels_like": 34.02,
            "pressure": 1017,
            "humidity": 35,
            "dew_point": 17.4,
            "uvi": 0.46,
            "clouds": 11,
            "visibility": 10000,
            "wind_speed": 12.68,
            "wind_deg": 304,
            "wind_gust": 20.56,
            "weather": [
                {
                    "id": 801,
                    "main": "Clouds",
                    "description": "few clouds",
                    "icon": "02d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1646776800,
            "temp": 40.01,
            "feels_like": 33.49,
            "pressure": 1019,
            "humidity": 36,
            "dew_point": 14.94,
            "uvi": 0,
            "clouds": 14,
            "visibility": 10000,
            "wind_speed": 10.38,
            "wind_deg": 301,
            "wind_gust": 19.19,
            "weather": [
                {
                    "id": 801,
                    "main": "Clouds",
                    "description": "few clouds",
                    "icon": "02d"
                }
            ],
            "pop": 0
        }
      ],
      "daily": [
        {
            "dt": 1646755200,
            "sunrise": 1646737697,
            "sunset": 1646779319,
            "moonrise": 1646748240,
            "moonset": 0,
            "moon_phase": 0.2,
            "temp": {
                "day": 40.91,
                "min": 33.35,
                "max": 46.18,
                "night": 33.35,
                "eve": 40.01,
                "morn": 37.38
            },
            "feels_like": {
                "day": 32.14,
                "night": 29.46,
                "eve": 33.49,
                "morn": 28.56
            },
            "pressure": 1015,
            "humidity": 39,
            "dew_point": 19.45,
            "wind_speed": 20.29,
            "wind_deg": 278,
            "wind_gust": 45.79,
            "weather": [
                {
                    "id": 801,
                    "main": "Clouds",
                    "description": "few clouds",
                    "icon": "02d"
                }
            ],
            "clouds": 19,
            "pop": 0.8,
            "uvi": 3.45
        },
        {
            "dt": 1646841600,
            "sunrise": 1646823996,
            "sunset": 1646865789,
            "moonrise": 1646836560,
            "moonset": 1646802900,
            "moon_phase": 0.23,
            "temp": {
                "day": 38.14,
                "min": 32.59,
                "max": 38.89,
                "night": 32.68,
                "eve": 34.47,
                "morn": 32.85
            },
            "feels_like": {
                "day": 34.12,
                "night": 32.68,
                "eve": 29.46,
                "morn": 32.85
            },
            "pressure": 1020,
            "humidity": 44,
            "dew_point": 17.76,
            "wind_speed": 5.61,
            "wind_deg": 152,
            "wind_gust": 9.89,
            "weather": [
                {
                    "id": 601,
                    "main": "Snow",
                    "description": "snow",
                    "icon": "13d"
                }
            ],
            "clouds": 100,
            "pop": 1,
            "snow": 4.63,
            "uvi": 1.87
        },
        {
            "dt": 1646928000,
            "sunrise": 1646910293,
            "sunset": 1646952259,
            "moonrise": 1646925180,
            "moonset": 1646893020,
            "moon_phase": 0.25,
            "temp": {
                "day": 43.36,
                "min": 31.95,
                "max": 48.16,
                "night": 35.24,
                "eve": 45.66,
                "morn": 32.67
            },
            "feels_like": {
                "day": 39.69,
                "night": 32.18,
                "eve": 42.75,
                "morn": 26.85
            },
            "pressure": 1021,
            "humidity": 55,
            "dew_point": 28.22,
            "wind_speed": 7.34,
            "wind_deg": 265,
            "wind_gust": 21.14,
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04d"
                }
            ],
            "clouds": 82,
            "pop": 0.81,
            "uvi": 3.82
        },
        {
            "dt": 1647014400,
            "sunrise": 1646996591,
            "sunset": 1647038729,
            "moonrise": 1647014280,
            "moonset": 1646982840,
            "moon_phase": 0.29,
            "temp": {
                "day": 41.58,
                "min": 32.5,
                "max": 46.17,
                "night": 39.04,
                "eve": 45.88,
                "morn": 32.5
            },
            "feels_like": {
                "day": 41.58,
                "night": 34.79,
                "eve": 42.01,
                "morn": 28.6
            },
            "pressure": 1022,
            "humidity": 44,
            "dew_point": 21,
            "wind_speed": 7.65,
            "wind_deg": 150,
            "wind_gust": 15.99,
            "weather": [
                {
                    "id": 801,
                    "main": "Clouds",
                    "description": "few clouds",
                    "icon": "02d"
                }
            ],
            "clouds": 24,
            "pop": 0,
            "uvi": 3.8
        },
        {
            "dt": 1647100800,
            "sunrise": 1647082888,
            "sunset": 1647125199,
            "moonrise": 1647103800,
            "moonset": 1647072420,
            "moon_phase": 0.32,
            "temp": {
                "day": 45.41,
                "min": 27.03,
                "max": 45.41,
                "night": 27.03,
                "eve": 37.09,
                "morn": 42.64
            },
            "feels_like": {
                "day": 44.15,
                "night": 14.43,
                "eve": 27.21,
                "morn": 37.56
            },
            "pressure": 992,
            "humidity": 99,
            "dew_point": 44.96,
            "wind_speed": 21.16,
            "wind_deg": 267,
            "wind_gust": 39.46,
            "weather": [
                {
                    "id": 616,
                    "main": "Snow",
                    "description": "rain and snow",
                    "icon": "13d"
                }
            ],
            "clouds": 100,
            "pop": 1,
            "rain": 18.59,
            "snow": 1.78,
            "uvi": 0.01
        },
        {
            "dt": 1647187200,
            "sunrise": 1647169185,
            "sunset": 1647211668,
            "moonrise": 1647193740,
            "moonset": 1647165120,
            "moon_phase": 0.35,
            "temp": {
                "day": 29.46,
                "min": 24.78,
                "max": 34.3,
                "night": 30.9,
                "eve": 34.3,
                "morn": 27.07
            },
            "feels_like": {
                "day": 17.28,
                "night": 23.14,
                "eve": 24.58,
                "morn": 14.47
            },
            "pressure": 1014,
            "humidity": 41,
            "dew_point": 8.1,
            "wind_speed": 21.88,
            "wind_deg": 262,
            "wind_gust": 42.84,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": 5,
            "pop": 0.15,
            "uvi": 1
        },
        {
            "dt": 1647273600,
            "sunrise": 1647255481,
            "sunset": 1647298137,
            "moonrise": 1647283980,
            "moonset": 1647250260,
            "moon_phase": 0.38,
            "temp": {
                "day": 43.48,
                "min": 33.66,
                "max": 51.31,
                "night": 41.58,
                "eve": 51.06,
                "morn": 34.07
            },
            "feels_like": {
                "day": 37.78,
                "night": 35.76,
                "eve": 48.51,
                "morn": 25.93
            },
            "pressure": 1021,
            "humidity": 52,
            "dew_point": 26.65,
            "wind_speed": 11.14,
            "wind_deg": 226,
            "wind_gust": 32.28,
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": 98,
            "pop": 0,
            "uvi": 1
        },
        {
            "dt": 1647360000,
            "sunrise": 1647341777,
            "sunset": 1647384606,
            "moonrise": 1647374400,
            "moonset": 1647338580,
            "moon_phase": 0.41,
            "temp": {
                "day": 48.63,
                "min": 39.7,
                "max": 57.45,
                "night": 45.27,
                "eve": 57.45,
                "morn": 39.7
            },
            "feels_like": {
                "day": 45.01,
                "night": 43.83,
                "eve": 55.44,
                "morn": 34.7
            },
            "pressure": 1014,
            "humidity": 65,
            "dew_point": 37.42,
            "wind_speed": 9.01,
            "wind_deg": 217,
            "wind_gust": 30.33,
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": 100,
            "pop": 0.05,
            "uvi": 1
        }
      ]
    }
  }

  it 'can create a possible road trip' do 
    duration = 6608
    origin = 'denver, co'
    destination = 'pueblo, co'

    roadtrip = RoadTrip.new(origin, destination, duration, forecast)

    expect(roadtrip.id).to eq(nil)
    expect(roadtrip.start_city).to eq(origin)
    expect(roadtrip.end_city).to eq(destination)
    expect(roadtrip.travel_time).to eq('Trip duration is 1 hours and 50 minutes.')
    expect(roadtrip.weather_at_eta).to eq({temperature: 41.38, conditions: 'few clouds'})
  end

  it 'can create a possible road trip longer than 48 hours' do 
    duration = 350000
    origin = 'denver, co'
    destination = 'pueblo, co'

    roadtrip = RoadTrip.new(origin, destination, duration, forecast)

    expect(roadtrip.id).to eq(nil)
    expect(roadtrip.start_city).to eq(origin)
    expect(roadtrip.end_city).to eq(destination)
    expect(roadtrip.travel_time).to eq('Trip duration is 97 hours and 13 minutes.')
    expect(roadtrip.weather_at_eta).to eq({temperature: 46.17, conditions: 'few clouds'})
  end

  it 'can create a possible road trip less than an hour' do 
    duration = 900
    origin = 'denver, co'
    destination = 'golden, co'

    roadtrip = RoadTrip.new(origin, destination, duration, forecast)

    expect(roadtrip.id).to eq(nil)
    expect(roadtrip.start_city).to eq(origin)
    expect(roadtrip.end_city).to eq(destination)
    expect(roadtrip.travel_time).to eq('Trip duration is 0 hours and 15 minutes.')
    expect(roadtrip.weather_at_eta).to eq({temperature: 41.58, conditions: 'few clouds'})
  end

  it 'can create an impossible road trip' do 
    duration = 'impossible route'
    origin = 'denver, co'
    destination = 'pueblo, co'
    forecast = {}

    roadtrip = RoadTrip.new(origin, destination, duration, forecast)

    expect(roadtrip.id).to eq(nil)
    expect(roadtrip.start_city).to eq(origin)
    expect(roadtrip.end_city).to eq(destination)
    expect(roadtrip.travel_time).to eq(duration)
    expect(roadtrip.weather_at_eta).to eq(forecast)
  end
end