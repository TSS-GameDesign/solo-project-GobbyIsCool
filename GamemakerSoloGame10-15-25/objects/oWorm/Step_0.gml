switch (state)
{
    //play anim
    case 0:
        image_speed = 1;

        if (image_index >= image_number - 1)
        {
            image_index = image_number - 1;
            image_speed = 0;
            pause_timer = pause_time;
            state = 1;
        }
    break;
    //pause for a sec
    case 1:
        image_speed = 0;
        pause_timer--;

        if (pause_timer <= 0)
        {
            image_speed = -1;
            state = 2;
        }
    break;
    //it's rewind time
    case 2:
        image_speed = -1;

        if (image_index <= 0)
        {
            image_index = 0;
            image_speed = 1;
            state = 0;
        }
    break;
}