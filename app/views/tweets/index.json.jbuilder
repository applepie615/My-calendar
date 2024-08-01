json.array!(@events) do |event|
    json.id event.id
    json.title event.title
    json.color event.color
    json.start event.starttime
    json.end event.endtime
end