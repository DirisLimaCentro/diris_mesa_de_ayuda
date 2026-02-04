def format_text_vertical(texto):
    new_string = ""
    temp = ""
    temp_final = ""
    for i in texto.split(" "):
        temp = temp + (" " if temp else "") + i
        if len(temp) >= 10:
            new_string += "\n" + temp
            temp = ""
            temp_final = ""
        else:
            temp_final = temp
    if temp_final:
        new_string += "\n" + temp_final
    return new_string
