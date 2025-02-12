type 'a t = ('a, unit) Hashtbl.t

let is_empty s = Hashtbl.length s = 0
let to_seq s = Hashtbl.to_seq_keys s
let create n = Hashtbl.create n
let add s v = Hashtbl.replace s v ()
let add_seq s vs = Seq.iter (fun v -> add s v) vs
let remove = Hashtbl.remove
let mem = Hashtbl.mem
let iter f set = Hashtbl.iter (fun k () -> f k) set
let clear = Hashtbl.clear
let length = Hashtbl.length
let copy = Hashtbl.copy

let filter_inplace f =
  Hashtbl.filter_map_inplace (fun k () -> if f k then Some () else None)

let filter_map f set =
  let res = create (length set) in
  Hashtbl.iter
    (fun k () -> match f k with Some n -> add res n | None -> ())
    set;
  res
